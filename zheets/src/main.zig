const std = @import("std");
const requestz = @import("requestz");
const oauth2 = requestz.oauth2;
const gen = @import("gen.zig");
pub const log_level: std.log.Level = .info;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .stack_trace_frames = 100 }){};
    defer std.debug.assert(!gpa.deinit());
    const alloc = gpa.allocator();
    var client = try requestz.Client.init(alloc);
    defer client.deinit();
    var secret = try oauth2.ApplicationSecret.readApplicationSecret(alloc, "cred.json");
    var auth = oauth2.InstalledFlowAuth.init(alloc, &client, &secret, .http_redirect);
    defer auth.deinit();
    var service = gen.Service.init(
        alloc,
        &client,
        &auth,
        &.{gen.Scope.spreadsheets.toStr()},
    );

    const spreadsheet_id = "1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms";
    const read_range = "Class Data!A2:E";
    var values = gen.Service.Spreadsheets.Values.init(read_range, spreadsheet_id);
    var response = try values.get(&service);
    defer response.deinit(&service);

    var output = std.ArrayList(u8).init(alloc);
    defer output.deinit();
    for (response.values) |value|
        try std.fmt.format(output.writer(), "{s}, {s}\n", .{ value[0], value[4] });
    try std.testing.expectEqualStrings(
        \\Alexandra, English
        \\Andrew, Math
        \\Anna, English
        \\Becky, Art
        \\Benjamin, English
        \\Carl, Art
        \\Carrie, English
        \\Dorothy, Math
        \\Dylan, Math
        \\Edward, English
        \\Ellen, Physics
        \\Fiona, Art
        \\John, Physics
        \\Jonathan, Math
        \\Joseph, English
        \\Josephine, Math
        \\Karen, English
        \\Kevin, Physics
        \\Lisa, Art
        \\Mary, Physics
        \\Maureen, Physics
        \\Nick, Art
        \\Olivia, Physics
        \\Pamela, Math
        \\Patrick, Art
        \\Robert, English
        \\Sean, Physics
        \\Stacy, Math
        \\Thomas, Art
        \\Will, Math
        \\
    , output.items);

    values.valueInputOptionSet("RAW");
    var update = try values.update(&service, &response);
    defer update.deinit(&service);
}
