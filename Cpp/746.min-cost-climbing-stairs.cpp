/*
 * @lc app=leetcode id=746 lang=cpp
 *
 * [746] Min Cost Climbing Stairs
 */

#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    int minCostClimbingStairs(vector<int>& cost) {
        int *dp = new int[cost.size()+1];
        dp[0] = 0;
        dp[1] = 0;

        for (int i = 2; i <= cost.size(); ++i) {
            dp[i] = min(dp[i-2] + cost[i-2], dp[i-1] + cost[i-1]);
        }
        return dp[cost.size()];
    }
};
// @lc code=end

