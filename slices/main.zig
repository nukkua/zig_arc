const std = @import("std");
const stdout = std.io.getStdOut().writer();

// slices es una referencia al primer elemento y la longitud

pub fn main() !void {
    const numbers = [4]u8{ 1, 2, 3, 4 };
    const slice: []const u8 = numbers[0..];
    const slice2: []const u8 = &numbers;
    const slice_partial: []const u8 = numbers[1..3];

    const foo: []const u8 = "foobar"[0..3];

    try stdout.print("foo pointer -> {}", .{foo.ptr});
    try stdout.print("foo -> {s} \n", .{foo});

    try stdout.print("slice -> {any} \n", .{slice});
    try stdout.print("slice 2 -> {any} \n", .{slice2});
    try stdout.print("slice partial -> {any}", .{slice_partial});
}
