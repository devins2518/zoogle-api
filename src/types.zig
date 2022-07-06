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

pub const Schema = struct {};

pub const Scope = struct {
    id: []const u8,
};
