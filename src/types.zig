const std = @import("std");
const json = std.json;
const Allocator = std.mem.Allocator;
const ParameterHashMap = std.StringHashMap(Parameter);

pub const Method = struct {
    const Self = @This();

    description: ?[]const u8,
    name: []const u8,
    http_method: HttpMethod,
    // TODO
    // id: []const u8,
    // parameters: ParameterHashMap,
    // path: []const u8,
    // response
    scopes: ?[]Scope,

    pub fn init(alloc: Allocator, name: []const u8, desc: ?[]const u8, http: []const u8, scopes: ?[]json.Value) !Self {
        const scope = if (scopes) |scope| blk: {
            var list = std.ArrayList(Scope).init(alloc);
            for (scope) |s| {
                try list.append(Scope{ .id = s.String });
            }
            break :blk list.items;
        } else null;
        return Self{
            .name = name,
            .description = desc,
            .http_method = HttpMethod.fromStr(http),
            .scopes = scope,
        };
    }

    pub fn deinit(self: *Self, alloc: Allocator) void {
        if (self.scopes) |scope| alloc.free(scope);
    }

    pub fn print(self: *const Self, writer: anytype, comptime indent: comptime_int) !void {
        const prefix = " " ** indent;
        try std.fmt.format(writer,
            \\{[pre]s}fn {[name]s}() requestz.Response {{
            \\{[pre]s}    
            \\{[pre]s}}}
            \\
        , .{ .pre = prefix, .name = self.name });
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

pub const Parameter = struct {
    description: ?[]const u8,
    default: ?[]const u8,
    location: []const u8,
    type: []const u8,
};

pub const Resource = struct {
    name: []const u8,
    full_name: []const u8,
    methods: ?[]Method,
    resources: ?[]Resource,
};

pub const Scope = struct {
    id: []const u8,
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
pub fn genAuth(values: json.ObjectMap, allocator: Allocator, writer: anytype) !void {
    const scopes = values.get("oauth2").?.Object.get("scopes").?;
    var scope_iter = scopes.Object.iterator();
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
        defer allocator.free(scope_name);
        scope_name[0] = std.ascii.toUpper(scope_name[0]);

        try std.fmt.format(writer,
            \\// {s}
            \\pub const {s}Scope = Scope{{
            \\    .id = "{s}",
            \\}};
            \\
            \\
        , .{
            scope.value_ptr.Object.get("description").?.String,
            scope_name,
            scope.key_ptr.*,
        });
    }
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
pub fn genResources(values: json.ObjectMap, allocator: Allocator, writer: anytype) !void {
    var resource_iter = values.iterator();
    while (resource_iter.next()) |resource| {
        const methods = resource.value_ptr.Object.get("methods").?;
        const resources = resource.value_ptr.Object.get("resources").?;
        var resource_name = try allocator.dupe(u8, resource.key_ptr.*);
        defer allocator.free(resource_name);
        resource_name[0] = std.ascii.toUpper(resource_name[0]);
        try std.fmt.format(writer,
            \\pub const {s} = struct {{
            \\
        , .{resource_name});

        var method_iter = methods.Object.iterator();
        _ = resources;
        while (method_iter.next()) |method| {
            const value = method.value_ptr.Object;
            var m = try Method.init(
                allocator,
                method.key_ptr.*,
                if (value.get("description")) |d| d.String else null,
                value.get("httpMethod").?.String,
                value.get("scopes").?.Array.items,
            );
            defer m.deinit(allocator);
            try m.print(writer, 4);
        }

        try std.fmt.format(writer,
            \\}};
            \\
        , .{});
    }
}
