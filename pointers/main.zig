const std = @import("std");

const Class = enum {
    wizard,
    thief,
};

const Character = struct {
    class: Class,
    gold: u32,
    health: u8 = 100,
    mentor: ?*u8 = null,
};

pub fn main() !void {
    // unreachable, undefined

    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello World!\n", .{});

    var num1: u8 = 2;
    const num1_pointer: *u8 = &num1;
    // const const_pointer_to_const_value: *const u8 = undefined;
    // const const_pointer_to_var_value: *u8 = undefined;
    // var var_pointer_to_const_value: *const u8 = undefined;
    // var var_pointer_to_var_value: *u8 = undefined;

    num1_pointer.* += num1_pointer.*;

    try stdout.print("num1 normal value -> {} \n", .{num1});
    try stdout.print("num1 pointer value -> {any} \n", .{num1_pointer.*});

    const value: ?u8 = undefined;
    std.debug.print("value -> {}", .{value});

    // orelse
}
