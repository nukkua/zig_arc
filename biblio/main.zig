const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

const Book = struct {
    id: u32,
    title: []const u8,
    author: []const u8,
    available: bool,

    pub fn display(self: Book) void {
        print("ID: {d}, Título: {s}, Autor: {s}, Disponible: {}\n", .{ self.id, self.title, self.author, self.available });
    }
};

const Library = struct {
    books: ArrayList(Book),
    allocator: Allocator,

    pub fn init(allocator: Allocator) Library {
        return Library{
            .books = ArrayList(Book).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn addBook(self: *Library, title: []const u8, author: []const u8) !void {
        const book = Book{
            .id = @intCast(self.books.items.len),
            .title = try self.allocator.dupe(u8, title),
            .author = try self.allocator.dupe(u8, author),
            .available = true,
        };
        try self.books.append(book);
    }

    // Método para buscar un libro por ID
    pub fn findBook(self: Library, id: u32) ?Book {
        for (self.books.items) |book| {
            if (book.id == id) {
                return book;
            }
        }
        return null;
    }

    // Método para prestar un libro
    pub fn borrowBook(self: *Library, id: u32) !void {
        for (self.books.items) |*book| {
            if (book.id == id) {
                if (!book.available) {
                    print("El libro no está disponible\n", .{});
                    return;
                }
                book.available = false;
                print("Libro prestado exitosamente\n", .{});
                // print("Libro -> {any}", .{book});
                return;
            }
        }
        print("Libro no encontrado\n", .{});
    }

    // Método para mostrar todos los libros
    pub fn displayAllBooks(self: Library) void {
        print("\n=== Catálogo de la Biblioteca ===\n", .{});
        for (self.books.items) |book| {
            book.display();
        }
    }

    pub fn deinit(self: *Library) void {
        for (self.books.items) |book| {
            self.allocator.free(book.title);
            self.allocator.free(book.author);
        }
        self.books.deinit();
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    // Creamos una instancia de la biblioteca
    var library = Library.init(allocator);
    defer library.deinit();

    // Agregamos algunos libros
    try library.addBook("Don Quijote", "Miguel de Cervantes");
    try library.addBook("Cien años de soledad", "Gabriel García Márquez");
    try library.addBook("El Aleph", "Jorge Luis Borges");

    // Mostramos todos los libros
    library.displayAllBooks();

    try library.borrowBook(1);

    // Mostramos el catálogo actualizado
    library.displayAllBooks();
}
