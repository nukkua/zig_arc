const std = @import("std");

const NumberError = error{
    TooBig,
    TooSmall,
};

pub fn main() !void {
    const numbers = [_]u8{ 1, 2, 3, 4, 5 };

    for (numbers) |num| {
        const valid_number = valid(num);
        if (valid_number) |value| {
            std.debug.print("value={}", .{value});
        } else |err| switch (err) {
            NumberError.TooBig => std.debug.print("big", .{}),
            NumberError.TooSmall => std.debug.print("small", .{}),
        }
    }
}

fn valid(n: u8) NumberError!u8 {
    if (n < 4) return NumberError.TooSmall;
    if (n > 4) return NumberError.TooBig;

    return n;
}
