const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    try stdout.print("Formating is boring af \n", .{});
    const is_valid: bool = true;
    var it_could_not_be_valid: bool = true;
    const string: []const u8 = "Hello";

    it_could_not_be_valid = false;

    try stdout.print("The value of is_valid {} \n", .{is_valid});
    try stdout.print("The value of could not be valid {} \n", .{it_could_not_be_valid});
    try stdout.print("Stringsito {s}", .{string});
}
