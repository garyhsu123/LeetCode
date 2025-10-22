/*
 * @lc app=leetcode id=424 lang=swift
 *
 * [424] Longest Repeating Character Replacement
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(1)
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var wordFrequencyMap: [Character: Int] = [:]
        var maxLength = 0
        var maxCount = 0
        var left = 0
        let sArray = Array(s)
        
        for right in 0..<sArray.count {
            if left == right, left == 0 {
                wordFrequencyMap[sArray[left]] = 1
                maxCount = 1
                maxLength = 1
                continue
            }

            let newCharacter = sArray[right]
            wordFrequencyMap[newCharacter, default: 0] += 1
            maxCount = max(maxCount, wordFrequencyMap[newCharacter, default: 0])

            if (right - left + 1 - maxCount) > k {
                let frequency = wordFrequencyMap[sArray[left], default: 0]
                wordFrequencyMap[sArray[left]] = max(0, frequency - 1)
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
// @lc code=end

