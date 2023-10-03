/*
 * @lc app=leetcode id=1512 lang=swift
 *
 * [1512] Number of Good Pairs
 */

// @lc code=start
// T.C. = O(n)
// S.C. = O(n)

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var counter = [Int: Int]()
        var ans = 0
        for num in nums {
            if let count = counter[num] {
                counter[num] = count + 1
                ans += count
            }
            else {
                counter[num] = 1
            }
        }
        return ans
    }
}
// @lc code=end

