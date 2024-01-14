/*
 * @lc app=leetcode id=12 lang=swift
 *
 * [12] Integer to Roman
 */

// @lc code=start
class Solution {
    let valueMaps = {
        var dict = [
        1: "I",
        4: "IV",
        5: "V",
        9: "IX",
        10: "X",
        40: "XL",
        50: "L",
        90: "XC",
        100: "C",
        400: "CD",
        500: "D",
        900: "CM",
        1000: "M",
        ]
        return dict.sorted(by: { $0.key > $1.key })
    }()

    func intToRoman(_ num: Int) -> String {
        var target = num
        var romanString = ""

        while target != 0 {
            let nextRomanMap = valueMaps.first(where: { $0.key <= target })!
            print(nextRomanMap)
            romanString += nextRomanMap.value
            target -= nextRomanMap.key
        }
        
        return romanString
    }
}
// @lc code=end

