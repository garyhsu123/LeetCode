/*
 * @lc app=leetcode id=11 lang=swift
 *
 * [11] Container With Most Water
 */

// @lc code=start
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxAmount = 0
        var left = 0
        var right = height.count - 1

        while left <= right {
            let amount = min(height[left], height[right]) * (right - left)
            maxAmount = max(maxAmount, amount)
            if height[left] >= height[right] { right -= 1 }
            else { left += 1}
        }

        return maxAmount
    }
}
// @lc code=end

