const std = @import("std");
const json = std.json;
const types = @import("types.zig");

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
            const scopes = e.value_ptr.Object.get("oauth2").?.Object.get("scopes").?;
            var scope_iter = scopes.Object.iterator();
            while (scope_iter.next()) |scope| {
                var scope_name = blk: {
                    const begin = std.mem.lastIndexOfLinear(u8, scope.key_ptr.*, "/") orelse
                        break :blk try allocator.dupe(u8, scope.key_ptr.*);
                    var scope_name = try std.ArrayList(u8).initCapacity(allocator, scope.key_ptr.len - (begin + 1));
                    scope_name.appendSliceAssumeCapacity(scope.key_ptr.*[begin + 1 ..]);

                    // Remove period if present
                    per: {
                        const period_idx = std.mem.indexOf(u8, scope_name.items, ".") orelse break :per;
                        std.debug.assert(scope_name.orderedRemove(period_idx) == '.');
                        scope_name.items[period_idx] = std.ascii.toUpper(scope_name.items[period_idx]);
                    }
                    break :blk scope_name.items;
                };
                defer allocator.free(scope_name);
                scope_name[0] = std.ascii.toUpper(scope_name[0]);

                try std.fmt.format(writer,
                    \\// {s}
                    \\const {s}Scope = Scope{{
                    \\    .id = "{s}",
                    \\}};
                    \\
                    \\
                , .{
                    scope.value_ptr.Object.get("description").?.String,
                    scope_name,
                    scope.key_ptr.*,
                });
            }
        } else if (std.mem.eql(u8, name, "methods")) {
            std.debug.print("\n{s}\n", .{name});
            try e.value_ptr.jsonStringify(.{ .whitespace = .{} }, std.io.getStdOut().writer());
        } else if (std.mem.eql(u8, name, "parameters") or
            std.mem.eql(u8, name, "resources") or
            std.mem.eql(u8, name, "schemas"))
        {
            continue;
            // std.debug.print("\n{s}\n", .{name});
            // try e.value_ptr.jsonStringify(.{ .whitespace = .{} }, std.io.getStdOut().writer());
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
