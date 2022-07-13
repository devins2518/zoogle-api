const std = @import("std");
const json = std.json;
const types = @import("types.zig");
const Method = types.Method;

pub const api_name = "zoogle-api-zig-client";
pub const api_version = "0.1.0";

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .stack_trace_frames = 100 }){};
    // defer std.debug.assert(!gpa.deinit());
    var allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 3) printHelpAndExit(args[0]);
    const api = try std.fs.cwd().readFileAlloc(allocator, args[1], std.math.maxInt(usize));
    defer allocator.free(api);
    const gen = try std.fs.cwd().createFile(args[2], .{});
    defer gen.close();
    const writer = gen.writer();

    var parser = json.Parser.init(allocator, true);
    defer parser.deinit();
    var parsed = try parser.parse(api);
    defer parsed.deinit();
    try std.fmt.format(writer,
        \\// Auto-generated file. DO NOT EDIT.
        \\
        \\const std = @import("std");
        \\const requestz = @import("requestz");
        \\const oauth2 = requestz.oauth2;
        \\const StringHashMap = std.StringHashMap;
        \\const Allocator = std.mem.Allocator;
        \\const Headers = requestz.Headers;
        \\
        \\pub const base_url = "{s}";
        \\pub const root_url = "{s}";
        \\
        \\
    , .{ parsed.root.Object.get("baseUrl").?.String, parsed.root.Object.get("rootUrl").?.String });

    var iter = parsed.root.Object.iterator();
    var auth_list = std.ArrayList([]const u8).init(allocator);
    defer auth_list.deinit();
    while (iter.next()) |e| {
        const name = e.key_ptr.*;
        if (std.mem.eql(u8, name, "auth")) {
            try types.genAuth(e.value_ptr.Object, allocator, writer, &auth_list);
        } else if (std.mem.eql(u8, name, "schemas")) {
            try types.genSchemas(e.value_ptr.Object, allocator, writer);
        } else if (std.mem.eql(u8, name, "parameters")) {
            continue;
        } else continue;
    }

    try types.genRootResources(parsed.root.Object, allocator, writer);

    try writer.writeAll(
        \\test "static analysis" {
        \\    std.testing.refAllDecls(@This());
        \\}
    );
}

fn printHelpAndExit(arg: []const u8) void {
    std.io.getStdOut().writer().print(
        \\Usage: {s} /path/to/api.json /path/to/gen.zig
        \\
        \\Generates Zig bindings for Google's APIs.
        \\
    , .{arg}) catch {};
    std.process.exit(1);
}
