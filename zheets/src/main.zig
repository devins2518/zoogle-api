const std = @import("std");
const requestz = @import("requestz");
const oauth2 = requestz.oauth2;
pub const gen = @import("gen.zig");

test "api example" {
    var alloc = std.testing.allocator;
    // const creds = try std.fs.cwd().readFileAlloc(alloc, "cred.json", std.math.maxInt(usize));
    const secret = oauth2.ApplicationSecret{};
    const auth = oauth2.InstalledFlowAuth.init(secret, .http_redirect);
    var client = try requestz.Client.init(alloc);
    try client.oauth_login(auth);
    const service = try gen.Service.new(&client);

    const spreadsheet_id = "1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms";
    const read_range = "Class Data!A2:E";
    const response = try service.spreadsheets.values.get(spreadsheet_id, read_range).do();

    if (response.values.len == 0) {
        std.debug.print("No data found", .{});
    } else {
        std.debug.print("Name, Major:", .{});
        for (response.values) |value| {
            std.debug.print("{s}, {s}\n", value[0], value[4]);
        }
    }
}
