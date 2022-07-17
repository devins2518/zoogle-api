const std = @import("std");
const json = std.json;
const main = @import("main.zig");
const Allocator = std.mem.Allocator;
const ParamHashMap = std.ArrayHashMap(Parameter, void, Parameter.Context, true);

pub const Method = struct {
    const Self = @This();
    allocator: Allocator,
    desc: ?[]const u8,
    name: []const u8,
    params: ParamHashMap,
    param_order: []const []const u8,
    method: HttpMethod,
    path: []const u8,
    id: []const u8,
    request_ty: ?[]const u8,
    return_ty: []const u8,
    return_alloc: bool,

    fn from(value: json.ObjectMap.Entry, allocator: Allocator, parent_fields: *ParamHashMap) anyerror!Self {
        var params = ParamHashMap.init(allocator);
        const obj = value.value_ptr.Object;
        if (obj.get("parameters")) |param| {
            var iter = param.Object.iterator();
            while (iter.next()) |p| {
                const pobj = p.value_ptr.Object;
                const param_name = p.key_ptr.*;
                const desc = if (pobj.get("description")) |d| d.String else null;
                const default = if (pobj.get("default")) |d| d.String else null;
                var ty = try tyStrFromJsonValue(&pobj, allocator);
                var optional = true;
                if (obj.get("parameterOrder")) |param_order| {
                    for (param_order.Array.items) |str| blk: {
                        if (std.mem.eql(u8, str.String, param_name)) {
                            optional = false;
                            break :blk;
                        }
                    }
                }

                // TODO format name in snake_case rather than camelCase
                if (!optional) {
                    try params.put(.{ .allocator = allocator, .desc = desc, .name = param_name, .ty = try allocator.dupe(u8, ty), .default = default, .optional = optional }, .{});
                }
                try parent_fields.put(.{ .allocator = allocator, .desc = desc, .name = param_name, .ty = ty, .default = default, .optional = optional }, .{});
            }
        }
        var param_order = std.ArrayList([]const u8).init(allocator);
        if (obj.get("parameterOrder")) |param| {
            var items = param.Array.items;
            for (items) |item| try param_order.append(item.String);
        }
        const response = obj.get("response");
        const return_ty = if (response) |res|
            try tyStrFromJsonValue(&res.Object, allocator)
        else
            "requestz.Response";
        var path = std.ArrayList(u8).init(allocator);
        try path.appendSlice(obj.get("path").?.String);
        var idx: usize = 0;
        while (std.mem.indexOfScalarPos(u8, path.items, idx, '{')) |start| {
            const end = std.mem.indexOfScalarPos(u8, path.items, idx, '}').?;
            try path.replaceRange(start, end - start + 1, "{s}");
            idx = start + 3;
        }

        return Self{
            .allocator = allocator,
            .desc = if (obj.get("description")) |d| d.String else null,
            .name = value.key_ptr.*,
            .params = params,
            .param_order = param_order.toOwnedSlice(),
            .method = HttpMethod.fromStr(obj.get("httpMethod").?.String),
            .path = path.toOwnedSlice(),
            .id = obj.get("id").?.String,
            .request_ty = if (obj.get("request")) |req|
                req.Object.get("$ref").?.String
            else
                null,
            .return_ty = return_ty,
            .return_alloc = response != null,
        };
    }
    fn print(self: *const Self, writer: anytype, indent: u32) !void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        if (self.desc) |d|
            try std.fmt.format(writer,
                \\{[pre]s}// {[desc]s}
                \\
            , .{
                .pre = pre.items,
                .desc = d,
            });
        try std.fmt.format(writer,
            \\{[pre]s}pub fn {[name]s}(
            \\{[pre]s}    self: *@This(),
            \\{[pre]s}    service: *Service,
            \\
        , .{ .pre = pre.items, .name = self.name });
        if (self.request_ty) |ty| {
            try std.fmt.format(writer,
                \\{s}    request: {s}Schema,
                \\
            , .{ pre.items, ty });
        }
        try std.fmt.format(writer,
            \\{[pre]s}) !{[ret]s} {{
            \\{[pre]s}    var headers = Headers.init(service.allocator);
            \\{[pre]s}    defer headers.deinit();
            \\{[pre]s}    var auth = std.ArrayList(u8).init(service.allocator);
            \\{[pre]s}    defer auth.deinit();
            \\{[pre]s}    const token = try service.auth.token(service.scopes);
            \\{[pre]s}    try auth.appendSlice("Bearer ");
            \\{[pre]s}    try auth.appendSlice(token.value);
            \\{[pre]s}    try headers.append("x-goog-api-client", service.user_agent);
            \\{[pre]s}    try headers.append("User-Agent", service.user_agent);
            \\{[pre]s}    try headers.append("Authorization", auth.items);
            \\{[pre]s}    inline for (std.meta.fields(Service)) |field| {{
            \\{[pre]s}        const opt = @typeInfo(field.field_type) == .Optional;
            \\{[pre]s}        if (opt) {{
            \\{[pre]s}            if (@field(service, field.name)) |f| {{
            \\{[pre]s}                switch (@typeInfo(@typeInfo(field.field_type).Optional.child)) {{
            \\{[pre]s}                    .Bool => if (f)
            \\{[pre]s}                        try headers.append(field.name, "true")
            \\{[pre]s}                    else
            \\{[pre]s}                        try headers.append(field.name, "false"),
            \\{[pre]s}                    else => try headers.append(field.name, f),
            \\{[pre]s}                }}
            \\{[pre]s}            }}
            \\{[pre]s}        }}
            \\{[pre]s}    }}
            \\{[pre]s}    inline for (std.meta.fields(@This())) |field| {{
            \\{[pre]s}        const opt = @typeInfo(field.field_type) == .Optional;
            \\{[pre]s}        if (!opt) try headers.append(field.name, @field(self, field.name));
            \\{[pre]s}    }}
            \\{[pre]s}    var url = std.ArrayList(u8).init(service.allocator);
            \\{[pre]s}    defer url.deinit();
            \\{[pre]s}    try url.appendSlice(service.base_url);
            \\{[pre]s}    try std.fmt.format(url.writer(), "{[path]s}?", .{{
            \\
        , .{ .pre = pre.items, .path = self.path, .ret = self.return_ty });
        for (self.param_order) |param| try std.fmt.format(writer, "{s}        self.{s},\n", .{ pre.items, param });
        try std.fmt.format(writer,
            \\{[pre]s}    }});
            \\{[pre]s}    var first = true;
            \\{[pre]s}    inline for (std.meta.fields(@This())) |field| {{
            \\{[pre]s}        const opt = @typeInfo(field.field_type) == .Optional;
            \\{[pre]s}        const f = @field(self, field.name);
            \\{[pre]s}        if (opt) {{
            \\{[pre]s}            if (f != null) {{
            \\{[pre]s}                if (!first) try url.append('&');
            \\{[pre]s}                try std.fmt.format(url.writer(), "{{s}}={{s}}", .{{field.name, f}});
            \\{[pre]s}                first = false;
            \\{[pre]s}            }}
            \\{[pre]s}        }}
            \\{[pre]s}    }}
            \\{[pre]s}    var idx: usize = 0;
            \\{[pre]s}    while (std.mem.indexOfScalarPos(u8, url.items, idx, ' ')) |begin| {{
            \\{[pre]s}        try url.replaceRange(begin, 1, "%20");
            \\{[pre]s}        idx = begin + 3;
            \\{[pre]s}    }}
            \\
        , .{ .pre = pre.items });
        if (self.request_ty != null) {
            try std.fmt.format(writer,
                \\{[pre]s}    const body = try std.json.stringifyAlloc(service.allocator, request, .{{.whitespace = .{{}}}});
                \\{[pre]s}    defer service.allocator.free(body);
                \\{[pre]s}    try headers.append("Content-Type", "application/json");
                \\{[pre]s}    const length = std.fmt.allocPrint(service.allocator, "{{}}", body.len);
                \\{[pre]s}    defer service.allocator.free(length);
                \\{[pre]s}    try headers.append("Content-Length", length);
                \\{[pre]s}    log.info("Body: {{s}}\n", .{{body}});
                \\{[pre]s}    var response = try service.client.{[method]s}(url.items, .{{ .headers = headers.items(), .content = body }});
                \\
            , .{ .pre = pre.items, .method = @tagName(self.method) });
        } else {
            try std.fmt.format(writer,
                \\{[pre]s}    var response = try service.client.{[method]s}(url.items, .{{ .headers = headers.items() }});
                \\
            , .{ .pre = pre.items, .method = @tagName(self.method) });
        }
        try std.fmt.format(writer,
            \\{[pre]s}    log.info("Response: {{s}}\n", .{{response.body}});
            \\{[pre]s}    defer response.deinit();
            \\{[pre]s}    var tokens = std.json.TokenStream.init(response.body);
            \\{[pre]s}    for (headers.items()) |header| log.info("Header:\n    Name: {{s}}, Value: {{s}}\n", .{{header.name.value, header.value}});
            \\{[pre]s}    log.info("Url: {{s}}\n", .{{url.items}});
            \\{[pre]s}    return std.json.parse({[ret]s}, &tokens, .{{ .allocator = service.allocator, .ignore_unknown_fields = false }});
            \\{[pre]s}}}
            \\
        , .{ .pre = pre.items, .ret = self.return_ty });
        // try std.fmt.format(writer, "{s}    @panic(\"TODO: {s}\");\n", .{ pre.items, self.name });
        // try std.fmt.format(writer, "{s}}}\n", .{pre.items});
    }

    fn deinit(self: *Self) void {
        const allocator = self.allocator;
        var param_iter = self.params.iterator();
        while (param_iter.next()) |param| param.key_ptr.deinit();
        self.params.deinit();
        if (self.return_alloc) allocator.free(self.return_ty);
        allocator.free(self.param_order);
        allocator.free(self.path);
    }
};

pub const HttpMethod = enum {
    const Self = @This();
    get,
    post,
    patch,
    delete,
    put,

    fn fromStr(str: []const u8) Self {
        return if (std.mem.eql(u8, str, "GET"))
            Self.get
        else if (std.mem.eql(u8, str, "POST"))
            Self.post
        else if (std.mem.eql(u8, str, "PATCH"))
            Self.patch
        else if (std.mem.eql(u8, str, "DELETE"))
            Self.delete
        else if (std.mem.eql(u8, str, "PUT"))
            Self.put
        else
            unreachable;
    }
};

const Parameter = struct {
    const Self = @This();
    allocator: Allocator,
    desc: ?[]const u8 = null,
    name: []const u8,
    ty: []const u8,
    default: ?[]const u8 = null,
    optional: bool,

    const Context = struct {
        pub fn hash(_: @This(), param: Self) u32 {
            return @truncate(u32, std.hash.Wyhash.hash(0, param.name));
        }
        pub fn eql(_: @This(), lhs: Self, rhs: Self, _: usize) bool {
            return std.mem.eql(u8, lhs.name, rhs.name);
        }
    };

    fn genField(self: *const Self, writer: anytype, indent: u32) !void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        if (self.desc) |d|
            try std.fmt.format(writer, "{s}// {s}\n", .{ pre.items, d });

        // TODO format name in snake_case rather than camelCase
        const opt = if (self.optional) "?" else "";
        try std.fmt.format(writer, "{s}@\"{s}\": {s}{s}", .{ pre.items, self.name, opt, self.ty });
        if (self.default) |default| {
            const str = if (std.mem.eql(u8, self.ty, "[]const u8")) "\"" else "";
            try std.fmt.format(writer, " = {s}{s}{s}", .{ str, default, str });
        } else if (self.optional)
            try std.fmt.format(writer, " = null", .{});
        try std.fmt.format(writer, ",\n", .{});
    }
    fn genArg(self: *const Self, writer: anytype, indent: u32) !void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        if (self.desc) |d|
            try std.fmt.format(writer, "{s}// {s}\n", .{ pre.items, d });

        // TODO format name in snake_case rather than camelCase
        try std.fmt.format(writer, "{s}{s}: {s},\n", .{ pre.items, self.name, self.ty });
    }

    fn genSetter(self: *const Self, writer: anytype, indent: u32) !void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        const opt = if (self.optional) "?" else "";
        try std.fmt.format(writer,
            \\{[pre]s}pub fn @"{[name]s}Set"(self: *@This(), val: {[opt]s}{[ty]s}) void {{
            \\{[pre]s}    self.@"{[name]s}" = val;
            \\{[pre]s}}}
            \\
        , .{
            .pre = pre.items,
            // TODO format name in snake_case rather than camelCase
            .name = self.name,
            .opt = opt,
            .ty = self.ty,
        });
    }
    fn deinit(self: *const Self) void {
        self.allocator.free(self.ty);
    }
};

pub const Resource = struct {
    const Self = @This();
    allocator: Allocator,
    name: []const u8,
    fields: ParamHashMap,
    resources: std.ArrayList(Resource),
    methods: std.ArrayList(Method),

    fn from(value: json.ObjectMap.Entry, allocator: Allocator) anyerror!Self {
        const obj = value.value_ptr.Object;
        var fields = ParamHashMap.init(allocator);
        // Generate resources
        var resources_list = std.ArrayList(Resource).init(allocator);
        if (obj.get("resources")) |resources| {
            var resource_iter = resources.Object.iterator();
            while (resource_iter.next()) |resource|
                try resources_list.append(try Resource.from(resource, allocator));
        }

        // Generate methods
        var method_list = std.ArrayList(Method).init(allocator);
        if (obj.get("methods")) |methods| {
            var method_iter = methods.Object.iterator();
            while (method_iter.next()) |method| {
                try method_list.append(try Method.from(method, allocator, &fields));
            }
        }

        return Self{
            .allocator = allocator,
            .name = value.key_ptr.*,
            // TODO
            .fields = fields,
            .resources = resources_list,
            .methods = method_list,
        };
    }

    fn printMember(self: *const Self, writer: anytype, indent: u32) anyerror!void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer,
            \\{s}pub const {c}{s} = struct {{
            \\
        , .{ pre.items, std.ascii.toUpper(self.name[0]), self.name[1..] });
        var key_iter = self.fields.iterator();
        while (key_iter.next()) |field|
            try field.key_ptr.genField(writer, indent + 4);
        for (self.resources.items) |resource|
            try resource.printMember(writer, indent + 4);
        key_iter = self.fields.iterator();
        while (key_iter.next()) |field|
            try field.key_ptr.genSetter(writer, indent + 4);
        for (self.methods.items) |method|
            try method.print(writer, indent + 4);
        try self.printInit(writer, indent + 4);
        try std.fmt.format(writer,
            \\{s}}};
            \\
        , .{pre.items});
    }
    fn printRoot(self: *const Self, writer: anytype) anyerror!void {
        try std.fmt.format(writer,
            \\pub const {s} = struct {{
            \\
        , .{self.name});
        var key_iter = self.fields.iterator();
        while (key_iter.next()) |field|
            try field.key_ptr.genField(writer, 4);
        for (self.resources.items) |resource|
            try resource.printMember(writer, 4);
        key_iter = self.fields.iterator();
        while (key_iter.next()) |field|
            try field.key_ptr.genSetter(writer, 4);
        for (self.methods.items) |method|
            try method.print(writer, 4);
        try self.printInit(writer, 4);
        try std.fmt.format(writer,
            \\}};
            \\
        , .{});
    }
    fn printInit(self: *const Self, writer: anytype, indent: u32) anyerror!void {
        const allocator = self.allocator;
        var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer, "{s}pub fn init(\n", .{pre.items});
        var field_iter = self.fields.iterator();
        while (field_iter.next()) |field| {
            if (field.key_ptr.default == null and !field.key_ptr.optional)
                try std.fmt.format(writer, "{s}    {s}: {s},\n", .{
                    pre.items,
                    field.key_ptr.name,
                    field.key_ptr.ty,
                });
        }
        try std.fmt.format(writer,
            \\{[pre]s}) @This() {{
            \\{[pre]s}    return @This(){{
        , .{ .pre = pre.items });
        field_iter = self.fields.iterator();
        while (field_iter.next()) |field| {
            if (field.key_ptr.default == null and !field.key_ptr.optional)
                try std.fmt.format(writer, "\n{[pre]s}        .{[name]s} = {[name]s},", .{
                    .pre = pre.items,
                    .name = field.key_ptr.name,
                });
        }
        try std.fmt.format(writer,
            \\
            \\{[pre]s}    }};
            \\{[pre]s}}}
            \\
        , .{ .pre = pre.items });
    }

    fn deinit(self: *Self) void {
        var field_iter = self.fields.iterator();
        while (field_iter.next()) |field| field.key_ptr.deinit();
        self.fields.deinit();
        for (self.resources.items) |*i| i.deinit();
        self.resources.deinit();
        for (self.methods.items) |*i| i.deinit();
        self.methods.deinit();
    }
};

fn tyStrFromJsonValue(obj: *const json.ObjectMap, allocator: Allocator) Allocator.Error![]const u8 {
    const maybe_ty = obj.get("type");
    var ret = std.ArrayList(u8).init(allocator);
    if (maybe_ty) |ty| {
        if (std.mem.eql(u8, ty.String, "integer"))
            if (obj.get("format")) |fmt|
                if (std.mem.eql(u8, fmt.String, "int32"))
                    try ret.appendSlice("i32")
                else
                    unreachable
            else
                try ret.appendSlice("i64")
        else if (std.mem.eql(u8, ty.String, "string"))
            try ret.appendSlice("[]const u8")
        else if (std.mem.eql(u8, ty.String, "boolean"))
            try ret.appendSlice("bool")
        else if (std.mem.eql(u8, ty.String, "any"))
            try ret.appendSlice("[]const u8")
        else if (std.mem.eql(u8, ty.String, "number"))
            if (obj.get("format")) |fmt|
                if (std.mem.eql(u8, fmt.String, "double"))
                    try ret.appendSlice("f64")
                else if (std.mem.eql(u8, fmt.String, "float"))
                    try ret.appendSlice("f32")
                else
                    unreachable
            else
                unreachable
        else if (std.mem.eql(u8, ty.String, "array")) {
            const items = obj.get("items").?.Object;
            const inner = try tyStrFromJsonValue(&items, allocator);
            defer allocator.free(inner);
            try ret.appendSlice("[]const ");
            try ret.appendSlice(inner);
        } else if (std.mem.eql(u8, ty.String, "object")) {
            try ret.appendSlice("StringHashMap(");
            try ret.appendSlice(obj.get("additionalProperties").?.Object.get("$ref").?.String);
            try ret.appendSlice("Schema)");
        } else {
            std.debug.print("\n{s}\n", .{ty});
            unreachable;
        }
    } else {
        const ref = obj.get("$ref").?;
        try ret.appendSlice(ref.String);
        try ret.appendSlice("Schema");
    }
    return ret.toOwnedSlice();
}
pub fn genAuth(values: json.ObjectMap, allocator: Allocator, writer: anytype, list: *std.ArrayList([]const u8)) !void {
    const scopes = values.get("oauth2").?.Object.get("scopes").?;
    var scope_iter = scopes.Object.iterator();
    var scope_names = std.ArrayList([]const u8).init(allocator);
    defer {
        for (scope_names.items) |item| allocator.free(item);
        scope_names.deinit();
    }
    try std.fmt.format(writer,
        \\pub const Scope = enum {{
        \\
    , .{});
    while (scope_iter.next()) |scope| {
        var scope_name = blk: {
            const begin = std.mem.lastIndexOfLinear(u8, scope.key_ptr.*, "/") orelse
                break :blk try allocator.dupe(u8, scope.key_ptr.*);
            var scope_name = try std.ArrayList(u8).initCapacity(allocator, scope.key_ptr.len - (begin + 1));
            scope_name.appendSliceAssumeCapacity(scope.key_ptr.*[begin + 1 ..]);

            // Remove period if present
            if (std.mem.indexOf(u8, scope_name.items, ".")) |idx| {
                std.debug.assert(scope_name.orderedRemove(idx) == '.');
                scope_name.items[idx] = std.ascii.toUpper(scope_name.items[idx]);
            }
            break :blk scope_name.items;
        };

        try std.fmt.format(writer,
            \\    // {s}
            \\    {s},
            \\
        , .{
            scope.value_ptr.Object.get("description").?.String,
            scope_name,
        });
        try scope_names.append(scope_name);
        try list.append(scope.key_ptr.*);
    }
    try std.fmt.format(writer,
        \\
        \\    pub fn toStr(self: @This()) []const u8 {{
        \\        return switch (self) {{
        \\
    , .{});
    for (scope_names.items) |name, i| {
        try std.fmt.format(writer,
            \\            .{s} => "{s}",
            \\
        , .{ name, list.items[i] });
    }
    try std.fmt.format(writer,
        \\        }};
        \\    }}
        \\}};
        \\
        \\
    , .{});
}
pub fn genSchemas(values: json.ObjectMap, allocator: Allocator, writer: anytype) !void {
    var schema_iter = values.iterator();
    while (schema_iter.next()) |schema_obj| {
        const schema = schema_obj.value_ptr.Object;
        if (schema.get("description")) |desc| {
            try std.fmt.format(writer,
                \\// {s}
                \\
            , .{desc.String});
        }
        try std.fmt.format(writer,
            \\pub const {s}Schema = struct {{
            \\    const Self = @This();
            \\
        , .{schema_obj.key_ptr.*});
        var prop_iter = schema.get("properties").?.Object.iterator();
        while (prop_iter.next()) |prop| {
            const prop_obj = prop.value_ptr.Object;
            if (prop_obj.get("description")) |desc| {
                try std.fmt.format(writer,
                    \\    // {s}
                    \\
                , .{desc.String});
            }
            const ty_name = try tyStrFromJsonValue(&prop_obj, allocator);
            defer allocator.free(ty_name);
            try std.fmt.format(writer,
                \\    {s}: {s}
            , .{ prop.key_ptr.*, ty_name });
            if (prop_obj.get("default")) |default| {
                try std.fmt.format(writer,
                    \\ = {s}
                , .{default.String});
            }
            try std.fmt.format(writer,
                \\,
                \\
            , .{});
        }
        try std.fmt.format(writer,
            \\    pub fn deinit(self: Self, service: *Service) void {{
            \\        std.json.parseFree(Self, self, .{{ .allocator = service.allocator }});
            \\    }}
            \\
            \\}};
            \\
        , .{});
    }
}
pub fn genRootResources(values: json.ObjectMap, allocator: Allocator, writer: anytype) !void {
    var fields = ParamHashMap.init(allocator);
    try fields.put(.{ .allocator = allocator, .name = "allocator", .ty = try allocator.dupe(u8, "Allocator"), .optional = false }, .{});
    try fields.put(.{ .allocator = allocator, .name = "client", .ty = try allocator.dupe(u8, "*requestz.Client"), .optional = false }, .{});
    try fields.put(.{ .allocator = allocator, .name = "auth", .ty = try allocator.dupe(u8, "*oauth2.Authenticator"), .optional = false }, .{});
    try fields.put(.{ .allocator = allocator, .name = "scopes", .ty = try allocator.dupe(u8, "[]const []const u8"), .optional = false }, .{});
    try fields.put(.{
        .allocator = allocator,
        .name = "base_url",
        .ty = try allocator.dupe(u8, "[]const u8"),
        .default = values.get("baseUrl").?.String,
        .optional = false,
    }, .{});
    try fields.put(.{
        .allocator = allocator,
        .name = "root_url",
        .ty = try allocator.dupe(u8, "[]const u8"),
        .default = values.get("rootUrl").?.String,
        .optional = false,
    }, .{});
    try fields.put(.{
        .allocator = allocator,
        .name = "user_agent",
        .ty = try allocator.dupe(u8, "[]const u8"),
        .default = std.fmt.comptimePrint("{s}/{s}", .{ main.api_name, main.api_version }),
        .optional = false,
    }, .{});
    if (values.get("parameters")) |param| {
        var iter = param.Object.iterator();
        while (iter.next()) |p| {
            const pobj = p.value_ptr.Object;
            const param_name = p.key_ptr.*;
            const desc = if (pobj.get("description")) |d| d.String else null;
            const default = if (pobj.get("default")) |d| d.String else null;
            var ty = try tyStrFromJsonValue(&pobj, allocator);
            // Force optional to segregate between param fields and internals added above
            try fields.put(.{ .allocator = allocator, .desc = desc, .name = param_name, .ty = ty, .default = default, .optional = true }, .{});
        }
    }
    var resources = try std.ArrayList(Resource).initCapacity(allocator, 4);
    if (values.get("resources")) |r| {
        var resource_iter = r.Object.iterator();
        while (resource_iter.next()) |res| {
            try resources.append(try Resource.from(res, allocator));
        }
    }
    var methods = try std.ArrayList(Method).initCapacity(allocator, 4);
    if (values.get("methods")) |m| {
        var method_iter = m.Object.iterator();
        while (method_iter.next()) |method| {
            try methods.append(try Method.from(method, allocator, &fields));
        }
    }
    var root = Resource{
        .allocator = allocator,
        .name = "Service",
        .fields = fields,
        .resources = resources,
        .methods = methods,
    };
    defer root.deinit();
    try root.printRoot(writer);
}
