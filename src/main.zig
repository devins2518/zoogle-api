const std = @import("std");
const json = std.json;
const types = @import("types.zig");
const Method = types.Method;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!gpa.deinit());
    var allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 3) printHelpAndExit(args[0]);
    const api = try std.fs.cwd().readFileAlloc(allocator, args[1], std.math.maxInt(usize));
    defer allocator.free(api);
    const gen = try std.fs.cwd().createFile(args[2], .{});
    defer gen.close();
    const writer = gen.writer();

    try writer.writeAll(
        \\// Auto-generated file. DO NOT EDIT.
        \\
        \\const std = @import("std");
        \\const requestz = @import("requestz");
        \\const Scope = @import("zoogle-api").Scope;
        \\const StringHashMap = std.StringHashMap;
        \\
        \\
    );

    var parser = json.Parser.init(allocator, true);
    defer parser.deinit();
    var parsed = try parser.parse(api);
    defer parsed.deinit();
    var iter = parsed.root.Object.iterator();
    while (iter.next()) |e| {
        const name = e.key_ptr.*;
        if (std.mem.eql(u8, name, "auth")) {
            try types.genAuth(e.value_ptr.Object, allocator, writer);
        } else if (std.mem.eql(u8, name, "resources")) {
            try types.genResources(e.value_ptr.Object, allocator, writer);
        } else if (std.mem.eql(u8, name, "schemas")) {
            try types.genSchemas(e.value_ptr.Object, allocator, writer);
        } else if (std.mem.eql(u8, name, "parameters") or
            std.mem.eql(u8, name, "methods"))
        {
            continue;
        } else continue;
    }
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
