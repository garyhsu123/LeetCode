/*
 * @lc app=leetcode id=557 lang=swift
 *
 * [557] Reverse Words in a String III
 */

// @lc code=start

// T.C. = O(n)
// S.C. = O(n)
class Solution {
    func reverseWords(_ s: String) -> String {
        var ss = Array(s)
        var insertIndex = 0

        for i in ss.indices {
            if ss[i] == " " {
                ss[insertIndex..<i].reverse()
                insertIndex = i + 1
                continue
            }
        }
        ss[insertIndex...].reverse()
        return String(ss)
    }
}
// @lc code=end

