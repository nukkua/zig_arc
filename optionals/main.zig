const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    try stdout.print("Hello \n", .{});

    // controlling optionals

    var optional: ?u8 = 10;
    var ptr_optional: ?*u8 = &optional;
    optional = null;
    ptr_optional = null;

    try stdout.print("{}", .{optional orelse 10});
    try stdout.print("{}", .{optional.?});

    // try stdout.print("{}", .{optional orelse unreachable});
}
