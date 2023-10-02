/*
 * @lc app=leetcode id=2038 lang=swift
 *
 * [2038] Remove Colored Pieces if Both Neighbors are the Same Color
 */

// @lc code=start
class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
       
        var win = 0
        var state = 0

        for c in colors {
            if c == "A", state > 0 { state += 1 }
            else if c == "B", state < 0 { state -= 1 }
            else if c == "A" { state = 1 }
            else { state = -1 }

            if state >= 3 { win += 1}
            else if state <= -3 { win -= 1 }
        }

        return win > 0
    }
    
}
// @lc code=end

