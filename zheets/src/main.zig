const std = @import("std");
const requestz = @import("requestz");
const oauth2 = requestz.oauth2;
pub const gen = @import("gen.zig");

test "static analysis" {
    std.testing.refAllDecls(@This());
}

test "api example" {
    var alloc = std.testing.allocator;
    const secret = oauth2.ApplicationSecret{};
    const auth = oauth2.InstalledFlowAuth.init(secret, .http_redirect);
    var client = try requestz.Client.init(alloc);
    try client.oauth_login(auth);
    var service = gen.Service.init(&client);

    const spreadsheet_id = "1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms";
    const read_range = "Class Data!A2:E";
    var values = gen.Service.Spreadsheets.Values.init(read_range, spreadsheet_id);
    const response = values.get(&service);

    if (response.values.len == 0) {
        std.debug.print("No data found", .{});
    } else {
        std.debug.print("Name, Major:", .{});
        for (response.values) |value| {
            std.debug.print("{s}, {s}\n", .{ value[0], value[4] });
        }
    }
}
