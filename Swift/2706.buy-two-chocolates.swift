/*
 * @lc app=leetcode id=2706 lang=swift
 *
 * [2706] Buy Two Chocolates
 */

// @lc code=start
class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var minPrice = min(prices[0], prices[1])
        var sum = prices[0]+prices[1]
        for i in 2..<prices.count {
            sum = min(sum, minPrice+prices[i])
            minPrice = min(minPrice, prices[i])
        }
        
        let remain = money - sum
        return remain >= 0 ? remain : money
    }
}
// @lc code=end

