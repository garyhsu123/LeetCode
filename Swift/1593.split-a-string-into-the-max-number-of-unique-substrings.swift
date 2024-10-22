/*
 * @lc app=leetcode id=1593 lang=swift
 *
 * [1593] Split a String Into the Max Number of Unique Substrings
 */

// @lc code=start
class Solution {
    // T.C.= O(n * 2 ^ n)
    // S.C.= O(n)
    func maxUniqueSplit(_ s: String) -> Int {
        var dict: Set<String> = []
        var maxUniqueSplit = 0
        self.maxUniqueSplit(dict: &dict, s: s, index: 0, maxUniqueSplit: &maxUniqueSplit)
        return maxUniqueSplit
    }

    func maxUniqueSplit(dict: inout Set<String>, s: String, index: Int, maxUniqueSplit: inout Int) {
        if index == s.count { return }

        for number in 1...s.count-index {
            let startIndex = s.index(s.startIndex, offsetBy: index)
            let endIndex = s.index(s.startIndex, offsetBy: index + number)
            let str = String(s[startIndex..<endIndex])
            if (dict.contains(str)) {
                continue
            }
            
            dict.insert(str)
            maxUniqueSplit = max(maxUniqueSplit, dict.count)
            self.maxUniqueSplit(dict: &dict, s: s, index: index + number, maxUniqueSplit: &maxUniqueSplit)
            dict.remove(str)
        }
        
    }
}
// @lc code=end

