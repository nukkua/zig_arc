const std = @import("std");
const time = std.time;
const stdout = std.io.getStdOut().writer();

fn worker1() !void {
    time.sleep(time.ns_per_ms * 1000);
    try stdout.print("worker 1 finished \n", .{});
}
fn worker2() !void {
    time.sleep(time.ns_per_ms * 2000);
    try stdout.print("worker 2 finished \n", .{});
}

pub fn main() !void {
    const thread1 = try std.Thread.spawn(.{}, worker1, .{});
    const thread2 = try std.Thread.spawn(.{}, worker2, .{});

    thread1.join();
    thread2.join();
}
