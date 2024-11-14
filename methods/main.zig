const std = @import("std");
const stdout = std.io.getStdOut().writer();

const Bar = struct {
    x: u8 = 0,
    pub fn a(self: Bar) !void {
        try stdout.print("showing the bar -> {} \n", .{self.x});
    }
    pub fn b(self: *Bar) void {
        self.x = 10;
    }
    pub fn c(self: *const Bar) !void {
        try stdout.print("showing the bar -> {} \n", .{self.x});
    }
};

pub fn main() !void {
    var some_a = Bar{};

    try some_a.a();
    some_a.b();
    try some_a.c();
}
