/*
 * @lc app=leetcode id=714 lang=cpp
 *
 * [714] Best Time to Buy and Sell Stock with Transaction Fee
 */
#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    int maxProfit(vector<int>& prices, int fee) {
        int **dp = new int*[prices.size()];

        for (int i = 0; i < prices.size(); ++i) {
            dp[i] = new int[2];
        }

        dp[0][0] = -prices[0];
        dp[0][1] = 0;

        int score = 0;
        for (int i = 1; i < prices.size(); ++i) {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] -  prices[i]);
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] + prices[i] - fee);
        }

        return dp[prices.size()-1][1]; 
    }
};
// @lc code=end

