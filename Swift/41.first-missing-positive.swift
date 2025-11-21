/*
 * @lc app=leetcode id=41 lang=swift
 *
 * [41] First Missing Positive
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var index = 0
        while index < nums.count {
            var correctIndex = nums[index] - 1
            guard correctIndex >= 0, correctIndex < nums.count else {
                index += 1
                continue
            }

            if nums[index] == nums[correctIndex] {
                index += 1
            } else {
                nums.swapAt(index, correctIndex)
            }
        }

        for i in 0..<nums.count {
            var expectNum = i + 1
            if nums[i] != expectNum {
                return expectNum
            }
        }

        return nums.count + 1
    }
}
// @lc code=end

