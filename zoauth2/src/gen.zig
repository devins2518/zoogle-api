// Auto-generated file. DO NOT EDIT.

const std = @import("std");
const requestz = @import("requestz");
const StringHashMap = std.StringHashMap;

const base_url = "https://www.googleapis.com/";
const root_url = "https://www.googleapis.com/";

pub const Scope = enum {
    // View your email address
    userinfoEmail,
    // See your personal info, including any personal info you've made publicly available
    userinfoProfile,
    // Associate you with your personal info on Google
    openid,

    fn toStr(self: @This()) []const u8 {
        return switch (self) {
            .userinfoEmail => "https://www.googleapis.com/auth/userinfo.email",
            .userinfoProfile => "https://www.googleapis.com/auth/userinfo.profile",
            .openid => "openid",
        };
    }
};

const TokeninfoSchema = struct {
    // Who is the intended audience for this token. In general the same as issued_to.
    audience: []const u8,
    // The email address of the user. Present only if the email scope is present in the request.
    email: []const u8,
    // The expiry time of the token, as number of seconds left until expiry.
    expires_in: i32,
    // To whom was the token issued to. In general the same as audience.
    issued_to: []const u8,
    // The space separated list of scopes granted to this token.
    scope: []const u8,
    // The obfuscated user id.
    user_id: []const u8,
    // Boolean flag which is true if the email address is verified. Present only if the email scope is present in the request.
    verified_email: bool,

};
const UserinfoSchema = struct {
    // The user's email address.
    email: []const u8,
    // The user's last name.
    family_name: []const u8,
    // The user's gender.
    gender: []const u8,
    // The user's first name.
    given_name: []const u8,
    // The hosted domain e.g. example.com if the user is Google apps user.
    hd: []const u8,
    // The obfuscated ID of the user.
    id: []const u8,
    // URL of the profile page.
    link: []const u8,
    // The user's preferred locale.
    locale: []const u8,
    // The user's full name.
    name: []const u8,
    // URL of the user's picture image.
    picture: []const u8,
    // Boolean flag which is true if the email address is verified. Always verified because we only return the user's primary email address.
    verified_email: bool = true,

};
pub const Service = struct {
    @"client": *requestz.Client,
    @"base_url": []const u8 = "base_url",
    @"root_url": []const u8 = "root_url",
    @"user_agent": []const u8 = "zoogle-api-zig-client/0.1.0",
    // Data format for the response.
    @"alt": []const u8 = "json",
    // Selector specifying which fields to include in a partial response.
    @"fields": ?[]const u8 = null,
    // API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    @"key": ?[]const u8 = null,
    // OAuth 2.0 token for the current user.
    @"oauth_token": ?[]const u8 = null,
    // Returns response with indentations and line breaks.
    @"prettyPrint": bool = true,
    // An opaque string that represents a user for quota purposes. Must not exceed 40 characters.
    @"quotaUser": ?[]const u8 = null,
    // Deprecated. Please use quotaUser instead.
    @"userIp": ?[]const u8 = null,
    @"access_token": ?[]const u8 = null,
    @"id_token": ?[]const u8 = null,
    pub const Userinfo = struct {
        pub const V2 = struct {
            pub const Me = struct {
                pub fn get(
                    self: *@This(),
                    service: *Service,
                ) UserinfoSchema {
                    // TODO: body
                    _ = self;
                    _ = service;
                    @panic("TODO: get");
                }
                pub fn init(
                ) @This() {
                    return @This(){
                    };
                }
            };
            pub fn init(
            ) @This() {
                return @This(){
                };
            }
        };
        pub fn get(
            self: *@This(),
            service: *Service,
        ) UserinfoSchema {
            // TODO: body
            _ = self;
            _ = service;
            @panic("TODO: get");
        }
        pub fn init(
        ) @This() {
            return @This(){
            };
        }
    };
    pub fn @"clientSet"(self: *@This(), val: *requestz.Client) void {
        self.@"client" = val;
    }
    pub fn @"base_urlSet"(self: *@This(), val: []const u8) void {
        self.@"base_url" = val;
    }
    pub fn @"root_urlSet"(self: *@This(), val: []const u8) void {
        self.@"root_url" = val;
    }
    pub fn @"user_agentSet"(self: *@This(), val: []const u8) void {
        self.@"user_agent" = val;
    }
    pub fn @"altSet"(self: *@This(), val: []const u8) void {
        self.@"alt" = val;
    }
    pub fn @"fieldsSet"(self: *@This(), val: ?[]const u8) void {
        self.@"fields" = val;
    }
    pub fn @"keySet"(self: *@This(), val: ?[]const u8) void {
        self.@"key" = val;
    }
    pub fn @"oauth_tokenSet"(self: *@This(), val: ?[]const u8) void {
        self.@"oauth_token" = val;
    }
    pub fn @"prettyPrintSet"(self: *@This(), val: bool) void {
        self.@"prettyPrint" = val;
    }
    pub fn @"quotaUserSet"(self: *@This(), val: ?[]const u8) void {
        self.@"quotaUser" = val;
    }
    pub fn @"userIpSet"(self: *@This(), val: ?[]const u8) void {
        self.@"userIp" = val;
    }
    pub fn @"access_tokenSet"(self: *@This(), val: ?[]const u8) void {
        self.@"access_token" = val;
    }
    pub fn @"id_tokenSet"(self: *@This(), val: ?[]const u8) void {
        self.@"id_token" = val;
    }
    pub fn tokeninfo(
        self: *@This(),
        service: *Service,
    ) TokeninfoSchema {
        // TODO: body
        _ = self;
        _ = service;
        @panic("TODO: tokeninfo");
    }
    pub fn init(
        client: *requestz.Client,
    ) @This() {
        return @This(){
            .client = client,
        };
    }
};
test "static analysis" {
    std.testing.refAllDecls(@This());
}