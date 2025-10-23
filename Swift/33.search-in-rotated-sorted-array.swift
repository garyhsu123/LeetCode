/*
 * @lc app=leetcode id=33 lang=swift
 *
 * [33] Search in Rotated Sorted Array
 */

// @lc code=start
class Solution {
    // T.C. = O(N)
    // S.C. = O()
    func search(_ nums: [Int], _ target: Int) -> Int {
        var startIndex = 0
        var lastIndex = nums.count - 1

        while startIndex < lastIndex {
            let midIndex = (startIndex + lastIndex) / 2
            let mid = nums[midIndex]

            if mid > nums[lastIndex] {
                startIndex = midIndex + 1
            } else {
                lastIndex = midIndex
            }
        }
        
        var pivot = startIndex

        startIndex = 0
        lastIndex = nums.count - 1

        while startIndex <= lastIndex {
            let midIndex = (startIndex + lastIndex) / 2

            let start = nums[(startIndex + pivot) % nums.count]
            let end = nums[(lastIndex + pivot) % nums.count]
            let mid = nums[(midIndex + pivot) % nums.count]

            if mid == target {
                return (midIndex + pivot) % nums.count
            } else if mid < target {
                startIndex = midIndex + 1
            } else {
                lastIndex = midIndex - 1
            }
        }

        return -1
    }
}
// @lc code=end

