/*
 * @lc app=leetcode id=7 lang=swift
 *
 * [7] Reverse Integer
 */

// @lc code=start
class Solution {

    /*
    func reverse(_ x: Int) -> Int {
        if x == Int32.min { return 0 }
        let signed: Int = x > 0 ? 1 : -1
        var abs_x_str = String(signed * x)
        abs_x_str = String(abs_x_str.reversed())

        var abs_x = Int(abs_x_str) ?? 0
        var reversed_x = abs_x * signed
        
        return (reversed_x >= Int32.min && reversed_x <= Int32.max) ? reversed_x : 0
    }
    */

    // [-2^31, 2^31-1]
    func reverse(_ x: Int) -> Int {
        if x == Int32.min { return 0 }
        let signed = x >= 0 ? 1 : -1
        
        var positive_x = x * signed
        var value = 0
        var factor = NSDecimalNumber(decimal: pow(10, (String(positive_x).count - 1))).intValue
        var int_max = 2147483647
        
        while positive_x > 0 {
            var digit = positive_x % 10
            if digit > int_max / factor { return 0 }
            value += digit * factor
          
            int_max -= digit * factor
            positive_x /= 10
            factor /= 10
        }


        return value * signed
    }
}
// @lc code=end

