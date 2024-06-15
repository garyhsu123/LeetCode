/*
 * @lc app=leetcode id=190 lang=swift
 *
 * [190] Reverse Bits
 */

// @lc code=start
class Solution {
    func reverseBits(_ n: Int) -> Int {
        var ans = 0
        var mutableN = n

        for i in stride(from: 31, through: 0, by: -1) {
            ans += (mutableN % 2) << i
            mutableN = mutableN / 2
        }
        return ans
    }

  
}
// @lc code=end

