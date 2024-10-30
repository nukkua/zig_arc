const std = @import("std");
const stdout = std.io.getStdOut().writer();

const Book = struct {
    id: u32,
    title: []const u8,
    author: []const u8,
    available: bool = true,

    fn show(self: *Book) !void {
        try stdout.print("ID: {d}, Título: {s}, Autor: {s}, Disponible: {s}\n", .{ self.id, self.title, self.author, if (self.available) "Si" else "No" });
    }
};
const Show = enum {
    yes,
    no,
};

pub fn main() !void {
    var book1: Book = Book{ .id = 10, .title = "El principito", .author = "Andrew Segales" };

    switch (Show.yes) {
        .yes => try book1.show(),
        .no => try stdout.print("Es azul hermano", .{}),
    }
}
