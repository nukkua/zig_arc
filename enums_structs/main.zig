const std = @import("std");

const Days = enum { lunes, martes, miercoles, jueves, viernes, sabado, domingo };

const Role = enum {
    wizard,
    thief,
    bard,
    warrior,
};

const Colors = enum(u32) { red = 0xff0000, blue = 0x00ff00, green = 0x0000ff };

const Character = struct {
    role: Role,
    gold: u32,
    experience: u32,
    health: u8,
};

pub fn main() !void {
    std.debug.print("Hello World!", .{});
    var glorp_the_wise: Character = Character{
        .role = Role.wizard,
        .gold = 10,
        .experience = 20,
        .health = 100,
    };

    // buff of health
    glorp_the_wise.health += 10;
    std.debug.print("{any}", .{glorp_the_wise});
}
