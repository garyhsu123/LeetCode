/*
 * @lc app=leetcode id=884 lang=swift
 *
 * [884] Uncommon Words from Two Sentences
 */

// @lc code=start
/// Solution 1
class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var unCommonWords = Set<String>()
        var commonWords = Set<String>()

        for word in "\(s1) \(s2)".split(separator: " ") {
            
            if commonWords.contains(String(word)) {
                continue
            }

            if unCommonWords.contains(String(word)) {
                unCommonWords.remove(String(word))
                commonWords.insert(String(word))
            }
            else {
                unCommonWords.insert(String(word))
            }

        }
        return Array(unCommonWords)
    }
}

// @lc code=end

