const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    try stdout.print("Hello world \n", .{});
    const trying: u8 = 10;

    const even = if (trying & 1 == 1) true else false;
    try stdout.print("{}", .{even});
}
