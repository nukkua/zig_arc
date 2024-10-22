const std = @import("std");

const Bi = struct {
    penis: ?bool = false,
};

const Human = struct {
    health: u8 = 2,
    pub fn hello() void {
        std.debug.print("Hello", .{});
    }
};

const Alien = struct {
    health: u8,
    pub fn hatch(strenght: u8) Alien {
        return Alien{
            .health = strenght * 5,
        };
    }
};

const HeatRay = struct {
    damage: u8,
    pub fn zap(self: HeatRay, alien: *Alien) void {
        alien.health -= if (self.damage >= alien.health) alien.health else self.damage;
    }
};

pub fn main() !void {
    const aliens: [4]Alien = [_]Alien{
        Alien.hatch(10),
        Alien.hatch(10),
        Alien.hatch(10),
        Alien.hatch(10),
    };
    std.debug.print("aliens -> {any}", .{aliens});

    // testing something null like try or catch in zig
    var humanBi: Bi = Bi{};
    // const isBi = humanBi.penis orelse false;
    humanBi.penis = null;
    const isHuman = humanBi.penis.?; // humanBi.penis orelse unreachable
    std.debug.print("humanBi has penis? {?}", .{isHuman});
}
