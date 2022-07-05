const std = @import("std");
const json = std.json;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    errdefer std.debug.assert(!gpa.deinit());
    var allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 3) printHelpAndExit(args[0]);
    const api = try std.fs.cwd().readFileAlloc(allocator, args[1], std.math.maxInt(usize));
    const gen = try std.fs.cwd().createFile(args[2], .{});
    defer gen.close();
    _ = api;
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
