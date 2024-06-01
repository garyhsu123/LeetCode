/*
 * @lc app=leetcode id=121 lang=swift
 *
 * [121] Best Time to Buy and Sell Stock
 */

// @lc code=start

// Solution 1
// T.C. = O(N^2)
// class Solution {
//     func maxProfit(_ prices: [Int]) -> Int {
//         var max = 0
//         for i in 0..<prices.count-1 {
//             for j in 1 ..< prices.count {
//                 max = max(max, prices[j]-prices[i])
//             }
//         }
//         return max
//     }
// }

// Solution 2
// T.C. = O(N)
// class Solution {
//     func maxProfit(_ prices: [Int]) -> Int {
//         var priceBuy = prices[0]
//         var maxProfit = 0

//         for idx in 1..<prices.count {
//             if prices[idx] < priceBuy {
//                 priceBuy = prices[idx]
//             }
//             else {
//                 maxProfit = max(maxProfit, prices[idx]-priceBuy)
//             }
//         }

//         return maxProfit
//     }
// }
// @lc code=end

