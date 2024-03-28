const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var prime_bits = std.StaticBitSet(limit + 1).initFull();

    for (2..std.math.sqrt(limit) + 1) |i| {
        if (prime_bits.isSet(i)) {
            var j = 2 * i;
            while (j <= limit) : (j += i) {
                prime_bits.unset(j);
            }
        }
    }

    var buffer_idx: usize = 0;

    for (2..limit + 1) |i| {
        if (prime_bits.isSet(i)) {
            buffer[buffer_idx] = @intCast(i);
            buffer_idx += 1;
        }
    }

    return buffer[0..buffer_idx];
}
