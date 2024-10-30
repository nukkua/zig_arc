const std = @import("std");

pub fn CsvParser(comptime T: type) type {
    return struct {
        allocator: std.mem.Allocator,

        const Self = @This();

        pub fn init(allocator: std.mem.Allocator) Self {
            return Self{
                .allocator = allocator,
            };
        }

        pub fn parseLine(self: *Self, line: []const u8) !T {
            var iter = std.mem.splitSequence(u8, line, ",");
            var result: T = undefined;

            inline for (std.meta.fields(T)) |field| {
                const value = iter.next() orelse return error.InvalidFormat;

                switch (@typeInfo(field.type)) {
                    .int => {
                        @field(result, field.name) = try std.fmt.parseInt(field.type, value, 10);
                    },
                    .float => {
                        @field(result, field.name) = try std.fmt.parseFloat(field.type, value);
                    },
                    .pointer => |ptr_info| {
                        if (ptr_info.size == .Slice and ptr_info.child == u8) {
                            @field(result, field.name) = try self.allocator.dupe(u8, value);
                        }
                    },
                    else => @compileError("Tipo no soportado"),
                }
            }

            return result;
        }
        pub fn free(self: *Self, value: T) void {
            inline for (std.meta.fields(T)) |field| {
                switch (@typeInfo(field.type)) {
                    .pointer => |ptr_info| {
                        if (ptr_info.size == .Slice and ptr_info.child == u8) {
                            self.allocator.free(@field(value, field.name));
                        }
                    },
                    else => {},
                }
            }
        }
    };
}

pub fn main() !void {
    const Person = struct {
        name: []const u8,
        age: u32,
        height: f32,
    };

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var parser = CsvParser(Person).init(allocator);

    const line = "John Doe,30,1.75";
    const person = try parser.parseLine(line);

    defer parser.free(person);

    std.debug.print("Nombre: {s}, Edad: {}, Altura: {d:.2}\n", .{ person.name, person.age, person.height });
}
