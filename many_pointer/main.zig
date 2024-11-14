const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const slice: []const u8 = "Pancakes";
    const many_pointer: [*]const u8 = "ala \x00";

    try stdout.print("slice -> {s}", .{slice});
    try stdout.print("many_pointer -> {any}", .{many_pointer});

    for (many_pointer) |item| {
        try stdout.print("{c}", .{item});
    }
}
