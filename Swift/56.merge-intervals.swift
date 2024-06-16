/*
 * @lc app=leetcode id=56 lang=swift
 *
 * [56] Merge Intervals
 */

// @lc code=start
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sortedIntervals = intervals
        sortedIntervals.sort(by: {
            return $0[0] < $1[0] || ($0[0] == $1[0] && $0[1] < $1[1])
        })
      
        return mergeSort(startIndex: 0, endIndex: sortedIntervals.count - 1, sortedIntervals)
    }

    func mergeSort(startIndex: Int, endIndex: Int, _ intervals: [[Int]]) -> [[Int]] {
        if startIndex == endIndex { return [intervals[startIndex]] }

        let mid = (startIndex + endIndex) / 2
        let leftIntervals = mergeSort(startIndex: startIndex, endIndex: mid, intervals)
        let rightIntervals = mergeSort(startIndex: mid + 1, endIndex: endIndex, intervals)

        return merge(leftIntervals: leftIntervals, rightIntervals: rightIntervals)
    }

    func merge(leftIntervals: [[Int]], rightIntervals: [[Int]]) -> [[Int]] {
        guard let leftLast = leftIntervals.last, let mergedIndex = rightIntervals.lastIndex(where: {
            leftLast[1] >= $0[0]
        }) else {
            var merged = leftIntervals
            merged.append(contentsOf: rightIntervals)
            return merged
        }
        
        var merged = leftIntervals
        merged.popLast()
        merged.append([min(leftLast[0], rightIntervals[mergedIndex][0]), max(leftLast[1], rightIntervals[mergedIndex][1])])
        merged.append(contentsOf: rightIntervals[rightIntervals.index(after: mergedIndex)...])

        
        return merged
    }
}
// @lc code=end

