const std = @import("std");
const stdout = std.io.getStdOut().writer();
const math = std.math;

const User = struct {
    id: u32,
    name: []const u8,
    email: []const u8,

    const Self = @This();

    pub fn init(id: u32, name: []const u8, email: []const u8) Self {
        return Self{
            .id = id,
            .name = name,
            .email = email,
        };
    }

    pub fn show(self: Self) !void {
        try stdout.print("user -> id {} , name {s}, email {s}", .{ self.id, self.name, self.email });
    }
};

const Vec = struct {
    x: f64,
    y: f64,
    z: f64,
    const Self = @This();

    pub fn distance(self: Self, other: Vec) !void {
        const xd = math.pow(f64, self.x - other.x, 2.0);
        const yd = math.pow(f64, self.y - other.y, 2.0);
        const zd = math.pow(f64, self.z - other.z, 2.0);
        return math.sqrt(xd + yd + zd);
    }
    pub fn modify_x(self: *Self) void {
        self.x = 20;
    }
};

pub fn main() !void {
    const user = User.init(10, "Marco", "marco.salazar.2014.com@gmail.com");
    try stdout.print("{any}", .{user});
    try stdout.print("\n", .{}); // second parameter is a anonymous struct literal

    try user.show();

    var vec = Vec{ .x = 10, .y = 10, .z = 10 };
    vec.modify_x();
    try stdout.print("{any}", .{vec});
}
