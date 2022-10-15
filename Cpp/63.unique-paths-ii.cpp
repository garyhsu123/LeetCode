/*
 * @lc app=leetcode id=63 lang=cpp
 *
 * [63] Unique Paths II
 */
#include <iostream>
#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    int uniquePathsWithObstacles(vector<vector<int>>& obstacleGrid) {
        const int m = obstacleGrid.size();
        const int n = obstacleGrid[0].size();

        int dp[m + 1][n + 1];

        for (int i = 0; i <= m; ++i) {
            for (int j = 0; j <= n; ++j) {
                if (i == 0 || j == 0 || obstacleGrid[i-1][j-1] == 1) dp[i][j] = 0; 
                else if (i == 1 && j == 1) dp[1][1] = 1; 
                else dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            }
        }
        return dp[m][n];
    }
};
// @lc code=end

