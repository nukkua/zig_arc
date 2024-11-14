const std = @import("std");
const stdout = std.io.getStdOut().writer();

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

const TypeStruct = enum {
    type1,
    type2,
    type3,
};

const SomeStruct = struct {
    value: u8 = 2,
    type: TypeStruct = TypeStruct.type1,
};

const HeatRay = struct {
    damage: u8,
    pub fn zap(self: HeatRay, alien: *Alien) void {
        alien.health -= if (self.damage >= alien.health) alien.health else self.damage;
    }
};

pub fn main() !void {
    const arr_some_struct: [4]SomeStruct = [_]SomeStruct{
        SomeStruct{ .value = 0b10000000 },
        SomeStruct{ .value = 255 },
        SomeStruct{ .value = 255 },
        SomeStruct{ .value = 255 },
    };
    for (arr_some_struct, 0..) |some_struct, i| {
        try stdout.print("i -> {d} value-> {b:1>9} ", .{ i, some_struct.value }); // string formatter for numbers infering the type, binary, hex, decimal
        // {b:1>9}
    }

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
