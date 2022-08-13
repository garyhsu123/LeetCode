/*
 * @lc app=leetcode id=121 lang=cpp
 *
 * [121] Best Time to Buy and Sell Stock
 */

#include <vector>
using   namespace std;
// @lc code=start
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int *dp = new int[prices.size()];
        dp[0] = prices[0];
        int score = 0;
        for (int i = 1; i < prices.size(); ++i) {
            dp[i] = min(dp[i - 1], prices[i]);
            score = max(score, prices[i] - dp[i - 1]);
        }
        return score;
    }
};
// @lc code=end

