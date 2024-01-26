/*
 * @lc app=leetcode id=13 lang=swift
 *
 * [13] Roman to Integer
 */

// @lc code=start
class Solution {

    let symbolValueTable: [String: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
    ]

    let subInstances: [String: Int] = [
        "IV": 4,
        "IX": 9,
        "XL": 40,
        "XC": 90,
        "CD": 400,
        "CM": 900
    ]

    func romanToInt(_ s: String) -> Int {

        var romanValue = 0

        var i = 0
        while (i < s.count) {
            let curIndex = s.index(s.startIndex, offsetBy: i)
            let curString = String(s[curIndex])

            if (curString == "I" || curString == "X" || curString == "C") && (i <= s.count - 2) {
                let nextString = String(s[s.index(after: curIndex)])
                if let value = subInstances["\(curString)\(nextString)"] {
                    romanValue += value
                    i += 2
                    continue
                }
            }
            
            romanValue += symbolValueTable[curString]!
            i += 1
        }
        
        return romanValue
    }
}
// @lc code=end

