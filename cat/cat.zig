const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;

fn cat(allocator: Allocator) !void {
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    if (args.len < 2) {
        std.log.err("Usage {s} filename to cat", .{args[0]});
        std.process.exit(1);
    }

    for (args[1..]) |arg| {
        const file_ = try std.fs.cwd().openFile(arg, .{});
        defer file_.close();

        const file_bytes = try file_.getEndPos();
        const writer = std.io.getStdOut().writer();
        const contents = try file_.readToEndAlloc(allocator, file_bytes);
        defer allocator.free(contents);

        try writer.writeAll(contents);
    }
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    try cat(allocator);
}
