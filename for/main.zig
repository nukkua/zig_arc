const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const condition: bool = true;

    var i: u32 = 0;

    while (condition) : (i += 1) {
        std.debug.print("Count: {} \n", .{i});

        if (i >= 2 and i < 10) continue;

        if (i == 10) break;
    }

    for (0..10) |j| {
        std.debug.print("{}", .{j});
    }

    std.debug.print("\n", .{});
    const just_my_arr: [3]i32 = [3]i32{ 1, 2, 3 };
    for (just_my_arr) |item| {
        std.debug.print("{}->", .{item});
    }

    std.debug.print("\n", .{});

    for (just_my_arr[1..3]) |item| {
        std.debug.print("{}", .{item});
    }
}
