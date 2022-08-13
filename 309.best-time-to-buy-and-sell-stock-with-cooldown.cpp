/*
 * @lc app=leetcode id=309 lang=cpp
 *
 * [309] Best Time to Buy and Sell Stock with Cooldown
 */
#include <vector>
using namespace std;
// @lc code=start
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int **dp = new int*[prices.size()];
        for (int i = 0; i < prices.size(); ++i) {
            dp[i] = new int[3];
        }
        dp[0][0] = -prices[0];
        dp[0][1] = dp[0][2] = 0;
        for (int i = 1; i < prices.size(); ++i) {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] - prices[i]);
            dp[i][1] = dp[i-1][2];
            dp[i][2] = max(dp[i-1][2], dp[i-1][0] + prices[i]);
        }
        return dp[prices.size() - 1][2];
    }
};
// @lc code=end

