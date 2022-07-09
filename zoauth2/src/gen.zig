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

pub const Service = struct {
    const Self = @This();
    client: *requestz.Client,
    base_url: []const u8 = base_url,
    root_url: []const u8 = root_url,
    user_agent: []const u8 = "zoogle-api-zig-client/0.1.0",

    userinfo: struct {
        v2: struct {
            me: struct {
                // 
                fn get(
                    self: *@This(),
                ) UserinfoSchema {
                    // TODO: body
                    _ = self;
                }
            },
        },
        // 
        fn get(
            self: *@This(),
        ) UserinfoSchema {
            // TODO: body
            _ = self;
        }
    },

    pub fn new(client: *requestz.Client) Self {
        return Self{ .client = client };
    }

    pub fn baseUrl(self: Self, url: []const u8) void {
        self.base_url = url;
    }
    pub fn rootUrl(self: Self, url: []const u8) void {
        self.root_url = url;
    }
    pub fn userAgent(self: Self, agent: []const u8) void {
        self.user_agent = agent;
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
