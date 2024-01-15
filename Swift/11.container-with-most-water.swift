/*
 * @lc app=leetcode id=11 lang=swift
 *
 * [11] Container With Most Water
 */

// @lc code=start
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        var leftIdx = 0
        var rightIdx = height.count - 1

        var curMaxArea = min(height[leftIdx], height[rightIdx]) * (rightIdx - leftIdx)

        
        while (rightIdx > leftIdx) {
            if height[rightIdx] > height[leftIdx] {
                leftIdx += 1
            }
            else {
                rightIdx -= 1
            }
            curMaxArea = max(curMaxArea, min(height[leftIdx], height[rightIdx]) * (rightIdx - leftIdx))
        }


        return curMaxArea
    }
}
// @lc code=end

