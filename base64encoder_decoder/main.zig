const std = @import("std");
const stdout = std.io.getStdOut().writer();

fn _calc_decode_len(input: []const u8) !usize {
    if (input.len < 4) {
        const n_output: usize = 3;

        return n_output;
    }
    const n_output: usize = try std.math.divFloor(
        usize,
        input.len,
        4,
    );

    return n_output * 3;
}

fn _calc_encode_len(input: []const u8) !usize {
    if (input.len < 3) {
        const n_output: usize = 4;

        return n_output;
    }
    const n_output: usize = try std.math.divCeil(usize, input.len, 3);

    return n_output * 4;
}

const Base64 = struct {
    _table: *const [64]u8,

    const Self = @This();

    pub fn init() Self {
        const upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const lower = "abcdefghijklmnopqrstuvwxyz";
        const numbers_symbols = "0123456789+/";

        return Self{
            ._table = upper ++ lower ++ numbers_symbols,
        };
    }

    pub fn _chart_at(self: Self, index: u8) u8 {
        return self._table[index];
    }
};

pub fn main() !void {
    const base64 = Base64.init();

    try stdout.print("{c}", .{base64._chart_at(10)});
}
