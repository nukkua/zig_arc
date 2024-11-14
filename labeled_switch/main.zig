const std = @import("std");
const stdout = std.io.getStdOut().writer();

// like a goto

pub fn main() !void {
    xsw: switch (@as(u8, 1)) {
        1 => {
            try stdout.print("First branch\n", .{});
            continue :xsw 2;
        },
        2 => {
            try stdout.print("Second branch\n", .{});
            continue :xsw 3;
        },
        3 => {},
        4 => {
            try stdout.print("Fourth branch \n", .{});
        },
        else => {},
    }

    const name = [_]u8{ 'P', 'e', 'd', 'r', 'o' };
    for (name) |char| {
        try stdout.print("{x} | ", .{char});
    }
}
