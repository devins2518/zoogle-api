pub const gen = @import("gen.zig");

test "basic add functionality" {
    const std = @import("std");
    const requestz = @import("requestz");
    const oauth2 = @import("oauth2");

    oauth2.providers.google.id = "google.com";
    oauth2.providers.google.scope = "https://www.googleapis.com/auth/spreadsheets.readonly";

    var alloc = std.testing.allocator;
    // const j = try std.fs.cwd().readFileAlloc(alloc, "credentials.json", std.math.maxInt(usize));

    // If modifying these scopes, delete your previously saved token.json.
    // config, err := google.ConfigFromJSON(b, "https://www.googleapis.com/auth/spreadsheets.readonly")
    // if err != nil {
    //         log.Fatalf("Unable to parse client secret file to config: %v", err)
    // }
    var client = try requestz.Client.init(&alloc);
    defer client.deinit();

    const service = try gen.newService(&client);

    // Prints the names and majors of students in a sample spreadsheet:
    // https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
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
