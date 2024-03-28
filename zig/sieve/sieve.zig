const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    return sieve(buffer, limit) catch unreachable;
}

fn sieve(buffer: []u32, limit: u32) ![]u32 {
    const allocator = std.heap.page_allocator;
    const is_prime = try allocator.alloc(bool, limit + 1);
    defer allocator.free(is_prime);
    @memset(is_prime, true);

    for (2..std.math.sqrt(limit) + 1) |i| {
        if (is_prime[i]) {
            var j = 2 * i;
            while (j <= limit) : (j += i) {
                is_prime[j] = false;
            }
        }
    }

    var buffer_idx: usize = 0;

    for (2..limit + 1) |i| {
        if (is_prime[i]) {
            buffer[buffer_idx] = @intCast(i);
            buffer_idx += 1;
        }
    }

    return buffer[0..buffer_idx];
}
