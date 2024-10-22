const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer(); // real hello world

    try stdout.print("Hello World!", .{});

    defer std.debug.print("3", .{}); // it excutes at the bottom of a code block
    // errdefer excutes at the bottom if theres an error

    std.debug.print("1", .{});
    std.debug.print("2", .{});
}
