/*
 * @lc app=leetcode id=81 lang=swift
 *
 * [81] Search in Rotated Sorted Array II
 */

// @lc code=start
class Solution {
    
    // T.C. = O(N)
    // S.C. = O(1)
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let length = nums.count
        var start = 0, end = length - 1
        while start <= end {
            var mid = (start + end) / 2

            if nums[mid] == target { return true }

            if nums[mid] == nums[end], nums[start] == nums[end] {
                start += 1
                end -= 1
            } else if nums[mid] > nums[end] {
                if target < nums[mid], target > nums[end] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
               if target > nums[mid], target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        } 

        return false
    }
}
// @lc code=end

