/*
 * @lc app=leetcode id=62 lang=cpp
 *
 * [62] Unique Paths
 */
#include <iostream>
using namespace std;
// @lc code=start
class Solution {
public:
    int uniquePaths(int m, int n) {
        int dp[m + 1][n + 1];

        for (int i = 0; i <= m; ++i) {
            for (int j = 0; j <= n; ++j) {
                if (i == 1 && j == 1) dp[1][1] = 1; 
                else if (i == 0 || j == 0) dp[i][j] = 0; 
                else dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            }
        }
        return dp[m][n];
    }
};
// @lc code=end

