const std = @import("std");
const stdout = std.io.getStdOut().writer();

const User = struct {
    id: usize,
    name: []const u8,

    const Self = @This();

    pub fn init(id: usize, name: []const u8) Self {
        return Self{
            .id = id,
            .name = name,
        };
    }
};

const RandomStruct = struct {
    id: u8,
    pointer: *const u8,
    yo: []const u8,
};

pub fn main() !void {
    var fc: u8 = 10;
    const rs = RandomStruct{ .id = 10, .pointer = &fc, .yo = "Hello" };
    const foo: u8 = 10;
    var fiz: u8 = 20;

    const const_ptr_const_val: *const u8 = &foo;
    const const_ptr_var_val: *u8 = &fiz;
    // theres nothing new about the example until here
    // its the principle of sustition, you can have a pointer that can modify the value that points to, you can have an pointer that doesnt, but no vice-versa
    const special_ptr: *const u8 = &fiz; // fiz is var but we treated like const

    // const_ptr_const_val.* += 1; its commented cuz its not possible
    // const_ptr_var_val.* += 1; its commented cuz its not possible
    _ = const_ptr_var_val.*;
    _ = special_ptr.*;

    try stdout.print("foo -> {}", .{const_ptr_const_val.*});
    try stdout.print("fiz -> {}", .{fiz});
    try stdout.print("Hello -> {}", .{rs.pointer});
}
