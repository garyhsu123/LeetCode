/*
 * @lc app=leetcode id=456 lang=swift
 *
 * [456] 132 Pattern
 */

// @lc code=start

// T.C. O(n^2)
// S.C. O(n)
class Solution {
    struct Line {
        var start: Int
        var end: Int

        func include(point: Int) -> Bool {
            return point > start && point < end
        }
    }

    func find132pattern(_ nums: [Int]) -> Bool {
        var lines: [Line] = []

        
        var i = 0
        
        while i < nums.count {
            if i == 0 {
                lines.append(Line(start: nums[i], end: nums[i]))
                i += 1
                continue
            }

            var newNum = nums[i]
            if let lastLine = lines.last, newNum < lastLine.start {
                lines.append(Line(start: newNum, end: newNum))
                continue
            }
            

            var newLine = lines.last!

            for line in lines.reversed() {
                if line.include(point: newNum) { return true }
                else if newNum >= line.end {
                    lines.popLast()
                }
            }
            newLine.end = newNum
            lines.append(newLine)


            i += 1
        }
        
        return false
    }
}
// @lc code=end

