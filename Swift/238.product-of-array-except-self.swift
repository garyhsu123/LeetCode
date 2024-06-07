/*
 * @lc app=leetcode id=238 lang=swift
 *
 * [238] Product of Array Except Self
 */

// @lc code=start
class Solution {
    // T.C. = O(N)
    // S.C. = O(N)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftProduct = Array(repeating: 1, count: nums.count)
        var rightProduct = leftProduct

        for i in 0..<nums.count {
            leftProduct[i] = (i == 0) ? 1 : leftProduct[i-1] * nums[i-1]
            rightProduct[nums.count-1-i] = (i == 0) ? 1 : rightProduct[nums.count-i] * nums[nums.count-i]
        }

        var answer = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            answer[i] = leftProduct[i] * rightProduct[i]
        }
        return answer
    }
}
// @lc code=end

