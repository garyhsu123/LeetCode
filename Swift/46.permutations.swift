/*
 * @lc app=leetcode id=46 lang=swift
 *
 * [46] Permutations
 */

// @lc code=start
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var m_nums: [Int] = nums
        var answer: [[Int]] = []

        solve(&answer, nums: &m_nums, startIdx: 0)

        return answer
    }

    func solve(_ answer: inout [[Int]], nums: inout [Int], startIdx: Int) {
        if startIdx == nums.count {
            answer.append(nums)
            return
        }
       
        
        for i in startIdx..<nums.count {
            swap(&nums, firstIdx: startIdx, secondIdx: i)
            solve(&answer, nums: &nums, startIdx: startIdx + 1)
            swap(&nums, firstIdx: startIdx, secondIdx: i)
        }
        
    }

    func swap(_ nums: inout [Int], firstIdx: Int, secondIdx: Int) {
        let tmp = nums[firstIdx]
        nums[firstIdx] = nums[secondIdx]
        nums[secondIdx] = tmp
    }
}
// @lc code=end

