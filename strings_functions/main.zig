const std = @import("std");

// std.mem.eql(): to compare if two strings are equal.
// std.mem.splitScalar(): to split a string into an array of substrings given a delimiter value.
// std.mem.splitSequence(): to split a string into an array of substrings given a substring delimiter.
// std.mem.startsWith(): to check if string starts with substring.
// std.mem.endsWith(): to check if string ends with substring.
// std.mem.trim(): to remove specific values from both start and end of the string.
// std.mem.concat(): to concatenate strings together. // it requires an allocator
// std.mem.count(): to count the occurrences of substring in the string.
// std.mem.replace(): to replace the occurrences of substring in the string. // it requires an allocator

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello", .{});

    const name = "Pedro"; // *const [5:0]u8

    var iterator = std.mem.splitScalar(u8, name, 'e');
    const untrimmed = "  Pepe  ";

    try stdout.print("Name == Pedro -> {} \n", .{std.mem.eql(u8, name, "Pedro")});
    try stdout.print("Pedro starts with Pe ? -> {} \n", .{std.mem.startsWith(u8, name, "Pe")});
    try stdout.print("Pedro ends with ol -> {} \n", .{std.mem.endsWith(u8, name, "ol")});
    try stdout.print("How manys o's are in the word Pedro? -> {} \n", .{std.mem.count(u8, name, "o")});

    while (iterator.next()) |item| {
        try stdout.print("Splited -> {s} \n", .{item});
    }
    const trimmed = std.mem.trim(u8, untrimmed, " "); // returns a slice []const u8

    try stdout.print("trimmed -> {s} and type of -> {} \n", .{ trimmed, @TypeOf(trimmed) });
}
