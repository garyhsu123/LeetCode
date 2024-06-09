/*
 * @lc app=leetcode id=69 lang=swift
 *
 * [69] Sqrt(x)
 */

// @lc code=start
class Solution {

    // T.C. = O(log(N))
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = 1 << 31 - 1
        
        while (right - left) > 1 {
            var mid = (left + right) / 2   
            if mid * mid <= x { left = mid }
            else { right = mid }
        }
        return left
    }
}
// @lc code=end

