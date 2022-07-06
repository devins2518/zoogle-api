pub const Method = struct {
    name: []const u8,
    http_method: HttpMethod,
    id: []const u8,
    parameters: []Parameter,
    path: []const u8,
    // TODO: response
    scopes: ?[]Scope,
};

pub const HttpMethod = enum { get, post, patch, delete, put };

pub const Parameter = struct {
    description: ?[]const u8,
    location: []const u8,
    type: []const u8,
    default: []const u8,
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
