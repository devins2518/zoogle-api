const std = @import("std");
const json = std.json;
const main = @import("main.zig");
const Allocator = std.mem.Allocator;

pub const Method = struct {
    const Self = @This();
    desc: ?[]const u8,
    name: []const u8,
    params: std.ArrayList(Parameter),
    return_ty: []const u8,
    return_alloc: bool,

    fn print(self: *const Self, alloc: Allocator, writer: anytype, indent: u32) !void {
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
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
            \\{[pre]s}fn {[name]s}(
            \\{[pre]s}    self: *@This(),
            \\
        , .{
            .pre = pre.items,
            .name = self.name,
        });
        for (self.params.items) |param|
            try param.genArg(alloc, writer, indent + 4);

        try std.fmt.format(writer,
            \\{[pre]s}) {[ret]s} {{
            \\
        , .{ .pre = pre.items, .ret = self.return_ty });

        try std.fmt.format(writer,
            \\{[pre]s}    // TODO: body
            \\{[pre]s}    _ = self;
            \\
        , .{ .pre = pre.items });
        for (self.params.items) |param|
            try std.fmt.format(writer, "{[pre]s}    _ = {[name]s};\n", .{
                .pre = pre.items,
                .name = param.name,
            });
        try std.fmt.format(writer,
            \\{[pre]s}}}
            \\
        , .{ .pre = pre.items });
    }
    fn from(value: json.ObjectMap.Entry, allocator: Allocator, parent_fields: *std.ArrayList(Parameter)) anyerror!Self {
        _ = parent_fields;
        var params = std.ArrayList(Parameter).init(allocator);
        const obj = value.value_ptr.Object;
        if (obj.get("parameters")) |param| {
            var iter = param.Object.iterator();
            while (iter.next()) |p| {
                const pobj = p.value_ptr.Object;
                const desc = if (pobj.get("description")) |d| d.String else null;
                const ty = try tyStrFromJsonValue(&pobj, allocator);
                // TODO format name in snake_case rather than camelCase
                const param_name = p.key_ptr.*;
                const parameter = Parameter{ .desc = desc, .name = param_name, .ty = ty };
                try params.append(parameter);
            }
        }
        if (obj.get("request")) |req| {
            const desc = if (req.Object.get("description")) |d| d.String else null;
            const ty = try tyStrFromJsonValue(&req.Object, allocator);
            const param_name = "schema";
            const parameter = Parameter{ .desc = desc, .name = param_name, .ty = ty };
            try params.append(parameter);
        }
        const response = obj.get("response");
        const return_ty = if (response) |res|
            try tyStrFromJsonValue(&res.Object, allocator)
        else
            "requestz.Response";

        return Self{
            .desc = if (obj.get("description")) |d| d.String else null,
            .name = value.key_ptr.*,
            .params = params,
            .return_ty = return_ty,
            .return_alloc = response != null,
        };
    }

    fn deinit(self: *Self, allocator: Allocator) void {
        for (self.params.items) |i| allocator.free(i.ty);
        self.params.deinit();
        if (self.return_alloc) allocator.free(self.return_ty);
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

    fn toStr(self: *const Self) []const u8 {
        return switch (self) {
            .get => "GET",
            .post => "POST",
            .patch => "PATCH",
            .delete => "DELETE",
            .put => "PUT",
        };
    }
};

const Parameter = struct {
    const Self = @This();
    desc: ?[]const u8 = null,
    name: []const u8,
    ty: []const u8,
    default: ?[]const u8 = null,
    fn genArg(self: *const Self, alloc: Allocator, writer: anytype, indent: u32) !void {
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        if (self.desc) |d|
            try std.fmt.format(writer, "{s}// {s}\n", .{ pre.items, d });

        // TODO format name in snake_case rather than camelCase
        try std.fmt.format(writer, "{s}{s}: {s},\n", .{ pre.items, self.name, self.ty });
    }

    fn genSetter(self: *const Self, alloc: Allocator, writer: anytype, indent: u32) !void {
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer,
            \\{[pre]s}fn {[name]s}Set(self: *@This(), val: {[ty]s}) void {{
            \\{[pre]s}    self.name = val;
            \\{[pre]s}}}
            \\
        , .{
            .pre = pre.items,
            // TODO format name in snake_case rather than camelCase
            .name = self.name,
            .ty = self.ty,
        });
    }
};

pub const Resource = struct {
    const Self = @This();
    name: []const u8,
    fields: std.ArrayList(Parameter),
    resources: std.ArrayList(Resource),
    methods: std.ArrayList(Method),

    fn from(value: json.ObjectMap.Entry, allocator: Allocator) anyerror!Self {
        const obj = value.value_ptr.Object;
        var fields = std.ArrayList(Parameter).init(allocator);
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
            .name = value.key_ptr.*,
            // TODO
            .fields = std.ArrayList(Parameter).init(allocator),
            .resources = resources_list,
            .methods = method_list,
        };
    }

    fn printMember(self: *const Self, alloc: Allocator, writer: anytype, indent: u32) anyerror!void {
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer,
            \\{s}{s}: struct {{
            \\
        , .{ pre.items, self.name });
        for (self.fields.items) |field|
            try field.genArg(alloc, writer, indent + 4);
        for (self.resources.items) |resource|
            try resource.printMember(alloc, writer, indent + 4);
        for (self.fields.items) |field|
            try field.genSetter(alloc, writer, indent + 4);
        for (self.methods.items) |method|
            try method.print(alloc, writer, indent + 4);
        try std.fmt.format(writer,
            \\{s}}},
            \\
        , .{pre.items});
    }
    fn printRoot(self: *const Self, alloc: Allocator, writer: anytype) anyerror!void {
        try std.fmt.format(writer,
            \\pub const {s} = struct {{
            \\
        , .{self.name});
        for (self.fields.items) |field|
            try field.genArg(alloc, writer, 4);
        for (self.resources.items) |resource|
            try resource.printMember(alloc, writer, 4);
        for (self.fields.items) |field|
            try field.genSetter(alloc, writer, 4);
        for (self.methods.items) |method|
            try method.print(alloc, writer, 4);
        try std.fmt.format(writer,
            \\}};
            \\
        , .{});
    }

    fn deinit(self: *Self, allocator: Allocator) void {
        for (self.resources.items) |*i| i.deinit(allocator);
        self.resources.deinit();
        for (self.methods.items) |*i| i.deinit(allocator);
        self.methods.deinit();
    }
};

fn tyStrFromJsonValue(obj: *const json.ObjectMap, allocator: Allocator) Allocator.Error![]const u8 {
    const maybe_ty = obj.get("type");
    if (maybe_ty) |ty| {
        return if (std.mem.eql(u8, ty.String, "integer"))
            if (obj.get("format")) |fmt|
                if (std.mem.eql(u8, fmt.String, "int32"))
                    try allocator.dupe(u8, "i32")
                else
                    unreachable
            else
                try allocator.dupe(u8, "i64")
        else if (std.mem.eql(u8, ty.String, "string"))
            try allocator.dupe(u8, "[]const u8")
        else if (std.mem.eql(u8, ty.String, "boolean"))
            try allocator.dupe(u8, "bool")
        else if (std.mem.eql(u8, ty.String, "any"))
            try allocator.dupe(u8, "*anyopaque")
        else if (std.mem.eql(u8, ty.String, "number"))
            if (obj.get("format")) |fmt|
                return if (std.mem.eql(u8, fmt.String, "double"))
                    try allocator.dupe(u8, "f64")
                else if (std.mem.eql(u8, fmt.String, "float"))
                    try allocator.dupe(u8, "f32")
                else
                    unreachable
            else
                unreachable
        else if (std.mem.eql(u8, ty.String, "array")) {
            var arr = std.ArrayList(u8).init(allocator);
            const items = obj.get("items").?.Object;
            const inner = try tyStrFromJsonValue(&items, allocator);
            defer allocator.free(inner);
            try arr.appendSlice(inner);
            return try arr.toOwnedSliceSentinel(0);
        } else if (std.mem.eql(u8, ty.String, "object")) {
            var arr = std.ArrayList(u8).init(allocator);
            try arr.appendSlice("StringHashMap(");
            try arr.appendSlice(obj.get("additionalProperties").?.Object.get("$ref").?.String);
            try arr.appendSlice("Schema)");
            return try arr.toOwnedSliceSentinel(0);
        } else {
            std.debug.print("\n{s}\n", .{ty});
            unreachable;
        };
    } else {
        var ty = std.ArrayList(u8).init(allocator);
        const ref = obj.get("$ref").?;
        try ty.appendSlice(ref.String);
        try ty.appendSlice("Schema");
        return try ty.toOwnedSliceSentinel(0);
    }
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
            per: {
                const period_idx = std.mem.indexOf(u8, scope_name.items, ".") orelse break :per;
                std.debug.assert(scope_name.orderedRemove(period_idx) == '.');
                scope_name.items[period_idx] = std.ascii.toUpper(scope_name.items[period_idx]);
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
        \\    fn toStr(self: @This()) []const u8 {{
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
            \\const {s}Schema = struct {{
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
            \\
            \\}};
            \\
        , .{});
    }
}
pub fn genRootResources(values: json.ObjectMap, allocator: Allocator, writer: anytype) !void {
    var fields = try std.ArrayList(Parameter).initCapacity(allocator, 4);
    defer fields.deinit();
    try fields.appendSlice(&.{
        .{ .name = "client", .ty = "*requestz.Client" },
        .{ .name = "base_url", .ty = "[]const u8", .default = "base_url" },
        .{ .name = "root_url", .ty = "[]const u8", .default = "root_url" },
        .{
            .name = "user_agent",
            .ty = "[]const u8",
            .default = main.api_name ++ "/" ++ main.api_version,
        },
    });
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
        .name = "Service",
        .fields = fields,
        .resources = resources,
        .methods = methods,
    };
    defer root.deinit(allocator);
    try root.printRoot(allocator, writer);
}
