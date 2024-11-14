const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn foo(x: u8) void {
    x = 10;
}

pub fn main() !void {
    try stdout.print("Hello world \n", .{});
    const trying: u8 = 10;

    const even = if (trying & 1 == 1) true else false;
    foo(10);
    try stdout.print("{}", .{even});
}
