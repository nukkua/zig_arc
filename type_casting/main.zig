const std = @import("std");
const stdout = std.io.getStdOut().writer();
const assert = std.debug.assert;
const expect = std.testing.expect;

pub fn main() !void {
    switch (@as(u8, 8)) {
        0...255 => try stdout.print("Yessir", .{}),
    }
    const x = @as(u16, 8);
    const y: i16 = 100;
    const z: f16 = @floatFromInt(y);

    try stdout.print("x -> {} \n", .{@TypeOf(x)});
    try stdout.print("z -> {} \n", .{@TypeOf(z)});

    // assert(@TypeOf(x) == u16);

    try expect(@TypeOf(x) == u16);
}
