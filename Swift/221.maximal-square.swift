/*
 * @lc app=leetcode id=221 lang=swift
 *
 * [221] Maximal Square
 */

// @lc code=start
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count

        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1)

        var ans = 0

        for i in 1...m {
            for j in 1...n {
                if matrix[i - 1][j - 1] == "0" { 
                    dp[i][j] = 0
                }
                else {
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1])) + 1
                    ans = max(ans, dp[i][j])
                }
            }
        }

        return ans * ans
    }
}
// @lc code=end

