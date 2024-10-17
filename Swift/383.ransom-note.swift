/*
 * @lc app=leetcode id=383 lang=swift
 *
 * [383] Ransom Note
 */

// @lc code=start
class Solution {
    // T.C. = O(n)
    // S.C. = O(n)
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var wof: [Character: Int] = [:]
        for c in magazine {
            if let f = wof[c] {
                wof[c] = f + 1
                continue
            }
            wof[c] = 1
        }

        for c in ransomNote {
            guard let f = wof[c], f > 0 else {
                return false
            }
            wof[c] = f - 1
        }
        return true
    }
}
// @lc code=end

