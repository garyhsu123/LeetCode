/*
 * @lc app=leetcode id=268 lang=swift
 *
 * [268] Missing Number
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func missingNumber(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        while i < nums.count {
            var targetIndex = nums[i] - 1
            if nums[i] == 0 || nums[i] == nums[targetIndex] {
                i += 1
                continue
            }
            nums.swapAt(i, targetIndex)
        }

        for i in 0..<nums.count {
            var expectNum = i + 1
            if nums[i] != expectNum {
                return expectNum
            }
        }

        return 0
    }
}
// @lc code=end

