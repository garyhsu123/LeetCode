/*
 * @lc app=leetcode id=228 lang=swift
 *
 * [228] Summary Ranges
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.isEmpty { return [] }
        else if nums.count == 1, let first = nums.first {
            return ["\(first)"]
        }

        var res = [(Int, Int)]()

        var startIdx = 0
        for i in 1..<nums.count {
            let diff = nums[i] - nums[startIdx]
            let offset = i - startIdx
            if diff > offset {
                res.append((nums[startIdx], nums[i - 1]))
                startIdx = i
            }

            if i == nums.count - 1 {
                res.append((nums[startIdx], nums[i]))
            }
        }

        return res.map { tuple in
            if tuple.0 == tuple.1 {
                return "\(tuple.0)"
            } else {
                return "\(tuple.0)->\(tuple.1)"
            }
            
        }
    }
}
// @lc code=end

