// GeneralPurposeAllocator(.{}){} -> Te puede dar bloques de diferentes tamanios, grande, mediano, pequeno
// page_allocator -> Te puedar dar un bloque de memoria grande, 4KB
// fixedBufferAllocator -> Un bloque con espacio limitado el cual no puede crecer
// arenaAllocator ->

const std = @import("std");
const stdout = std.io.getStdOut().writer();
const Allocator = std.mem.Allocator;
const assert = std.debug.assert;

pub fn main() !void {
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // defer _ = gpa.deinit();

    // const allocator = gpa.allocator();

    // const args = try std.process.argsAlloc(allocator);
    // defer std.process.argsFree(allocator, args);

    // try stdout.print("{s}", .{args[0]});

    const allocator = std.heap.page_allocator; // a full page of memory is allocated ~4KB

    const memory = try allocator.alloc(u8, 100); // 100 bytes as a []u8
    defer allocator.free(memory);

    assert(memory.len == 100);
    assert(@TypeOf(memory) == []u8);
}
