const std = @import("std");

// pub fn main() !void { // can return an error
//     const writer = std.io.getStdOut().writer();
//     try writer.print("Hello, {s}!\n", .{"world"});
// }

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello ,{s}\n", .{"world"});
    std.debug.print("Hello world! \n", .{});

    var my_sum: i32 = 0;
    const my_arr: [5]i32 = [5]i32{ 1, 2, 3, 4, 5 };

    for (my_arr, 0..) |arr, i| {
        std.debug.print("{}", .{my_arr[i]});
        my_sum += arr;
    }
    my_sum = 0;
    // transform to int @intCast();

    std.debug.print("\n", .{});
    while (true) : (my_sum += 1) {
        if (my_sum & 1 == 1) break;
        std.debug.print("just iterating \n", .{});
    }
}
