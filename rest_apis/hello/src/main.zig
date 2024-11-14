const std = @import("std");
const zap = @import("zap");

fn on_request(r: zap.Request) void {
    if (r.path) |path| {
        std.debug.print("The request PATH is", .{path});
    }

    r.sendBody("Hello") catch return;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{
        .thread_safe = true,
    }){};

    defer _ = gpa.deinit();

    {}
}
