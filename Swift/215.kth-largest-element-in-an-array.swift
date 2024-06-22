/*
 * @lc app=leetcode id=215 lang=swift
 *
 * [215] Kth Largest Element in an Array
 */

// @lc code=start
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums

        return quickSelect(left: 0, right: nums.count - 1, &nums, nums.count - k)
    }

    // Lomuto’s Partition Scheme:
    func quickSelect(left: Int, right: Int, _ nums: inout [Int], _ k: Int) -> Int {
    
        var maxValueIndex = left
        var pivot = nums[right]

        for i in left..<right {
            if nums[i] <= pivot {
                nums.swapAt(maxValueIndex, i)
                maxValueIndex += 1
            }
        }
        nums.swapAt(maxValueIndex, right)
    
        if maxValueIndex < k { 
            return quickSelect(left: maxValueIndex + 1, right: right, &nums, k) }
        else if maxValueIndex > k {
            return quickSelect(left: left, right: maxValueIndex - 1, 
            &nums, k)
        }
        else {
            return nums[maxValueIndex]
        }
    }   
}
// @lc code=end

