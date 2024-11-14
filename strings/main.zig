const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    const simple_array = [_]i32{ 1, 2, 3, 4 }; //[4]i32
    const string_lit = "Hello"; // pointer to the first and len *const [5:0]u8
    const slice: []const u8 = string_lit[1..]; // []const u8. slice of const
    const comp_int = 10; // comptime_int

    try stdout.print("Type simple array 1 -> {} \n", .{@TypeOf(simple_array)});
    try stdout.print("Type string literal  2 -> {} \n", .{@TypeOf(string_lit)});
    try stdout.print("Type 3 slice -> {} \n", .{@TypeOf(slice)});

    try stdout.print("Type 4 i32 comptime_int -> {} \n", .{@TypeOf(comp_int)});
}
