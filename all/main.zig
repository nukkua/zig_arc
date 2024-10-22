const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    print("Hello World! \n", .{});

    // simple variables
    var variable: i32 = 1;
    var variable2: u32 = 1;
    variable += 1;
    variable2 += 1;
    const constante: i32 = 2;
    print("var -> {} const -> {}", .{ variable, constante });

    // arrays
    var foo: [3]u32 = [3]u32{ 1, 2, 3 };
    foo[0] = 10;
    const bar = [_]u32{ 1, 2, 34 };

    // concat arrays like its nothing
    const letters = [4]u8{ 1, 2, 3, 4 };

    const sum_of_letters = letters ++ [2]u8{ 4, 3 };

    const double_letters = letters ** 2;

    print("\n {any} \n", .{bar});
    print("\n {any} \n", .{sum_of_letters});
    print("\n {any} \n", .{double_letters});

    //strings
    const fooz = "Hello World!";
    std.debug.print("{s}", .{fooz});
    const fooc: u8 = fooz[0];
    print("{}", .{fooc});

    const foozlarge =
        \\Ziggy
        \\Large 
        \\String
    ;
    print("{s}", .{foozlarge});

    // if
    const just_some_bool: bool = true;
    print("{}", .{just_some_bool});
    const some_value_ternara: i32 = if (just_some_bool) 18 else 2;
    print("\t{any}", .{some_value_ternara});

    const foousize: usize = 10;
    print("\n{}\n", .{foousize});
}
