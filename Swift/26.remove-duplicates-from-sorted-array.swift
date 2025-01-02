/*
 * @lc app=leetcode id=26 lang=swift
 *
 * [26] Remove Duplicates from Sorted Array
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var uniqueNums = [Int]()
        for num in nums {
            if uniqueNums.last != num {
                uniqueNums.append(num)
            }
        }

        for i in 0..<uniqueNums.count {
            nums[i] = uniqueNums[i]
        }

        return uniqueNums.count
    }
}
// @lc code=end

