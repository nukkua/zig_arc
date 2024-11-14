const std = @import("std");
const stdout = std.io.getStdOut().writer();

const CompilerError = error{ // this is a error union
    NotFound,
    IncreasingTooMuch,
};

const Foo = union {
    small: u8,
    medium: u32,
    large: u64,
};
const FooEnum = enum { small, medium, large };

const Color = enum(u32) {
    red = 0xff0000,
    blue = 0x00ff00,
    green = 0x0000ff,
};

const FooTwo = union(FooEnum) {
    small: u8,
    medium: u32,
    large: u64,
};

pub fn main() !void {
    var error_or_u8: CompilerError!u8 = undefined;

    error_or_u8 = CompilerError.NotFound;
    try stdout.print("error_or_u8 -> {!} \n", .{error_or_u8});
}
