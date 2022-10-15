/*
 * @lc app=leetcode id=70 lang=cpp
 *
 * [70] Climbing Stairs
 */
using namespace std;
// @lc code=start
class Solution {
public:
    int *dp = nullptr;
    int climbStairs(int n) {
        if (!dp) dp = new int[46];
        dp[0] = dp[1] = 1;
        for (int i = 2; i <= n; ++i) {
            dp[i] = dp[i-1] + dp[i-2];
        }

        
        return dp[n];
    }
};
// @lc code=end

