/*
 * @lc app=leetcode id=9 lang=swift
 *
 * [9] Palindrome Number
 */

// @lc code=start
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        var strX = String(x)
        return strX == String(strX.reversed())
    }
}
// @lc code=end

