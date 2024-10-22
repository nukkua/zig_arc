const std = @import("std");
const os = std.os;
const print = std.debug.print;
const assert = std.debug.assert;

pub fn main() !void {
    print("Hello world! {s} \n", .{"Hola"});

    const one_plus_one: i32 = 1 + 1;
    const seven_div_three: f32 = 7 / 3;
    var one_plus_one_var: i32 = 1 + 1;

    // changing the variable
    one_plus_one_var += 1;
    // const
    print("{} \n", .{one_plus_one});
    print("{} \n", .{seven_div_three});

    // var
    print("{} \n", .{one_plus_one_var});

    // boolean
    print("{} \n", .{true and true});

    // optional values
    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);

    optional_value = "Hi";
    assert(optional_value != null);

    var number_or_error: anyerror!i32 = error.ArgNotFound;

    print("{any}", .{number_or_error});

    number_or_error = 2;
}
