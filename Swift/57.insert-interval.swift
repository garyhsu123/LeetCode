/*
 * @lc app=leetcode id=57 lang=swift
 *
 * [57] Insert Interval
 */

// @lc code=start
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count == 0 {
            return [newInterval]
        }
        
        var intervals = intervals
        intervals.sort(by: { u, v in 
            return u[0] <= v[0] && u[1] < v[1] 
        })

        var toBeMergedInterval = newInterval
        if intervals[0][0] > toBeMergedInterval[1] {
            return [toBeMergedInterval] + intervals
        } else if intervals[intervals.count - 1][1] < toBeMergedInterval[0] {
            return intervals + [toBeMergedInterval]
        } else {
            let firstIndex = intervals.firstIndex(where: { $0[1] >= toBeMergedInterval[0] })!
            let lastIndex = intervals.lastIndex(where: { toBeMergedInterval[1] >= $0[0] })!
            return Array(intervals[..<firstIndex]) +  [[min(toBeMergedInterval[0], intervals[firstIndex][0]), max(toBeMergedInterval[1], intervals[lastIndex][1])]] + Array(intervals[intervals.index(after: lastIndex)...])
            
        }

    }
}
// @lc code=end

