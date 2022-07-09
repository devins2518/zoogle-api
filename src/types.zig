const std = @import("std");
const json = std.json;
const main = @import("main.zig");
const Allocator = std.mem.Allocator;
const ParameterHashMap = std.StringHashMap(Parameter);

pub const Method = struct {
    pub fn print(alloc: Allocator, values: json.ObjectMap.Unmanaged.Entry, writer: anytype, indent: u32) !void {
        const name = values.key_ptr.*;
        const obj = values.value_ptr.Object;
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer,
            \\{[pre]s}// {[desc]s}
            \\{[pre]s}fn {[name]s}(
            \\{[pre]s}    self: *@This(),
            \\
        , .{
            .desc = if (obj.get("description")) |d| d.String else "",
            .pre = pre.items,
            .name = name,
        });
        if (obj.get("parameter")) |param|
            try Parameter.print(alloc, param.Object, writer, indent + 4);
        if (obj.get("request")) |req| {
            const ty = try tyStrFromJsonValue(&req.Object, alloc);
            defer alloc.free(ty);
            try std.fmt.format(writer,
                \\{[pre]s}    schema: {[ty]s},
                \\
            , .{ .pre = pre.items, .ty = ty });
        }
        const response = obj.get("response");
        const return_ty = if (response) |res|
            try tyStrFromJsonValue(&res.Object, alloc)
        else
            "requestz.Response";
        defer if (response != null) alloc.free(return_ty);

        try std.fmt.format(writer,
            \\{[pre]s}) {[ret]s} {{
            \\    
        , .{ .pre = pre.items, .ret = return_ty });

        try std.fmt.format(writer,
            \\{[pre]s}// TODO: body
            \\{[pre]s}}}
            \\
        , .{ .pre = pre.items });
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
    fn print(alloc: Allocator, params: json.ObjectMap, writer: anytype, indent: u32) !void {
        var params_iter = params.iterator();
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        while (params_iter.next()) |param| {
            const obj = param.value_ptr.Object;
            const ty = try tyStrFromJsonValue(&obj, alloc);
            defer alloc.free(ty);
            try std.fmt.format(writer,
                \\{[pre]s}// {[desc]s}
                \\{[pre]s}{[name]s}: {[ty]s},
                \\
            , .{
                .pre = pre.items,
                .desc = if (obj.get("description")) |d| d.String else "",
                // TODO format name in snake_case rather than camelCase
                .name = param.key_ptr.*,
                .ty = ty,
            });
        }
    }
};

pub const Resource = struct {
    name: []const u8,
    full_name: []const u8,
    methods: ?[]Method,
    resources: ?[]Resource,

    pub fn print(alloc: Allocator, values: json.ObjectMap.Unmanaged.Entry, writer: anytype, indent: u32) !void {
        const name = values.key_ptr.*;
        var pre = try std.ArrayList(u8).initCapacity(alloc, indent);
        defer pre.deinit();
        pre.appendNTimesAssumeCapacity(' ', indent);
        try std.fmt.format(writer,
            \\{s}{s}: struct {{
            \\
        , .{ pre.items, name });
        genResources(values, alloc, writer, indent) catch unreachable;
        try std.fmt.format(writer,
            \\{[pre]s}}},
            \\
        , .{ .pre = pre.items });
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
pub fn genRootResources(values: json.ObjectMap.Unmanaged.Entry, allocator: Allocator, writer: anytype) !void {
    var iter = values.value_ptr.Object.iterator();
    std.debug.assert(iter.len == 1);
    const val = iter.next().?;
    try std.fmt.format(writer,
        \\pub const Service = struct {{
        \\    client: *requestz.Client,
        \\    base_url: []const u8 = base_url,
        \\    root_url: []const u8 = root_url,
        \\    user_agent: []const u8 = "{s}",
        \\
        \\    {s}: struct {{
        \\
    , .{ main.api_name ++ "/" ++ main.api_version, val.key_ptr.* });
    try genResources(val, allocator, writer, 4);
    try std.fmt.format(writer,
        \\    }},
        \\}};
        \\
        \\
    , .{});
}
fn genResources(values: json.ObjectMap.Unmanaged.Entry, allocator: Allocator, writer: anytype, indent: u32) !void {
    var pre = try std.ArrayList(u8).initCapacity(allocator, indent);
    defer pre.deinit();
    pre.appendNTimesAssumeCapacity(' ', indent);
    const obj = values.value_ptr.Object;
    // Generate resources
    if (obj.get("resources")) |resources| {
        var resource_iter = resources.Object.iterator();
        while (resource_iter.next()) |resource| {
            try Resource.print(allocator, resource, writer, indent + 4);
        }
    }

    // Generate methods
    if (obj.get("methods")) |methods| {
        var method_iter = methods.Object.iterator();
        while (method_iter.next()) |method| {
            try Method.print(allocator, method, writer, indent + 4);
        }
    }
}
