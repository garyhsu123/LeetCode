/*
 * @lc app=leetcode id=1 lang=swift
 *
 * [1] Two Sum
 */
import Foundation

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Time = O(n^2), Space = O(1)
        // for i in 0..<nums.count-1 {
        //     for j in i+1..<nums.count {
        //         if (nums[i] + nums[j] == target) { return [i, j] }
        //     }
        // }
        // return []
        
        
        // Time: O(N), Space: O(N)
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if (dict[target-num] != nil) {
                return [i, dict[target-num]!]
            }
            dict[num] = i
        }
        return []
    }
}
// @lc code=end

