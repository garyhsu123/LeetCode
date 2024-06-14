/*
 * @lc app=leetcode id=118 lang=swift
 *
 * [118] Pascal's Triangle
 */

// @lc code=start
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var dp = [[Int]]()
        for _ in 0..<numRows {
            guard let last = dp.last else {
                dp.append([1])
                continue
            }
            var tmp = [Int]()
            for i in 0...last.count {
                if i == 0 || i == last.count { tmp.append(1) }
                else { tmp.append(last[i] + last[i - 1]) }
            }
            dp.append(tmp)
        }
        return dp
    }
}
// @lc code=end

