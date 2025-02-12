// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// 带约束爬楼梯：动态规划
fn climbing_stairs_constraint_dp(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // 初始化 dp 表，用于存储子问题的解
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // 初始状态：预设最小子问题的解
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状态转移：从较小子问题逐步求解较大子问题
    for (3..n + 1) |i| {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbing_stairs_constraint_dp(n);
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
