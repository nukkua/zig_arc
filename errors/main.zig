const std = @import("std");

const MyNumberError = error{
    TooBig,
    TooSmall,
    TooFour,
};

pub fn main() !void {
    std.debug.print("Hello World!", .{});
    const num = inferError(1);
    std.debug.print("Num == {}", .{num});

    // error union
    var my_err_union: MyNumberError!u8 = 1;

    my_err_union = MyNumberError.TooBig;

    std.debug.print("\nI compiled! \n", .{});

    // deal with error unions
    const catch_my_err: i32 = catchMyError(5) catch 22;
    std.debug.print("\nIf its an error 22 == {}", .{catch_my_err});

    // deal with error unions 2

}

fn inferError(n: u8) MyNumberError {
    if (n > 4) return MyNumberError.TooBig;
    if (n < 4) return MyNumberError.TooSmall;

    return MyNumberError.TooFour;
}
fn catchMyError(n: i32) MyNumberError!i32 {
    if (n > 4) return MyNumberError.TooBig;

    return n;
}

fn detect(n: i32) MyNumberError!i32 {
    if (n < 10) return MyNumberError.TooSmall;
    if (n > 20) return MyNumberError.TooBig;

    return n;
}
