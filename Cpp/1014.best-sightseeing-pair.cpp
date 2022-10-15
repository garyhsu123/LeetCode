/*
 * @lc app=leetcode id=1014 lang=cpp
 *
 * [1014] Best Sightseeing Pair
 */
#include <vector>
using namespace std;

// @lc code=start 
class Solution {
public:
    int maxScoreSightseeingPair(vector<int>& values) {
        int *dp = new int[values.size()];
        dp[0] = values[0];
        int score = INT_MIN;
        for (int i = 1; i < values.size(); ++i) {
            dp[i] = max(dp[i - 1], values[i] + i);
            score = max(score, dp[i - 1] + values[i] - i);
        }
        return score;
    }
};
// @lc code=end

