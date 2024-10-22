const std = @import("std");
// switch can return values, like a super ternary, in fact it is

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello World! \n", .{});

    const lang_chars = [_]u8{ 1, 2, 3, 4, 5, 6 };

    for (lang_chars) |lg| {
        switch (lg) {
            1 => std.debug.print("Pene", .{}),
            2 => std.debug.print("Pene 2", .{}),
            else => {
                std.debug.print("Pene desgarrador", .{});
            },
        }
        std.debug.print("\n", .{});
    }
    const foo: u8 = if (true) lang_chars[0] else lang_chars[1];

    const foobar: u8 = switch (20) {
        1 => 1,
        2 => 2,
        else => unreachable,
    };

    std.debug.print("\n foo -> {}", .{foo});
    std.debug.print("\n foobar -> {}", .{foobar});
}
