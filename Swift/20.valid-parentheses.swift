/*
 * @lc app=leetcode id=20 lang=swift
 *
 * [20] Valid Parentheses
 */

// @lc code=start
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for c in s {
            if let lastCharacter = stack.last,
            lastCharacter == "(" && c == ")" ||
            lastCharacter == "[" && c == "]" ||
            lastCharacter == "{" && c == "}" {
                stack.removeLast()
                continue
            }

            stack.append(c)
        }

        return stack.isEmpty
    }
}
// @lc code=end

