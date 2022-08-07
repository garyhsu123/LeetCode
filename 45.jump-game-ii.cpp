/*
 * @lc app=leetcode id=45 lang=cpp
 *
 * [45] Jump Game II
 */
#include <vector>
#include <iostream>
using namespace std;
// @lc code=start
class Solution {
public:
    int jump(vector<int>& nums) {
        int *dp = new int[nums.size()];
        for (int i = 0; i < nums.size(); ++i) {

            dp[i] = (i == 0) ? 0 : 10000;
        }
        for (int i = 0; i < nums.size() - 1; ++i) {
            for (int j = i; j <= i + nums[i] && j < nums.size(); ++j) {
                dp[j] = min(dp[j], dp[i] + 1);
            }
        }
        return dp[nums.size() - 1];
    }
};
// @lc code=end

