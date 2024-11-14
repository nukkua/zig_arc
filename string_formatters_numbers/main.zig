const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

// show me something natural

pub fn main() !void {
    const random_number: u32 = 0b1000; // 8
    const large_string: []const u8 =
        \\Hi pussies
        \\Suck my Dick
    ;
    try stdout.print("{s} \n", .{large_string});
    try stdout.print("{b:1>5} \n", .{random_number}); // it  converts to 0b11000
    // {format:relleno>digits} > means push the original number to the right "right padding" < means push the original number to the left "left padding"
    try stdout.print("{b:1>4}", .{random_number}); // it  converts to 0b1000 and yes, still the same
}
