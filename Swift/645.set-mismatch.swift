/*
 * @lc app=leetcode id=645 lang=swift
 *
 * [645] Set Mismatch
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var nums = nums
        var index = 0

        while index < nums.count {
            var correctIndex = nums[index] - 1
            if nums[correctIndex] != nums[index] {
                nums.swapAt(index, correctIndex)
            } else {
                index += 1
            }
        }
        
        for i in 0..<nums.count {
            let expect = i + 1
            if nums[i] != expect {
                return [nums[i], expect]
            }
        }

        return []
    }
}
// @lc code=end

