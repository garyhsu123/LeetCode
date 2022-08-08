/*
 * @lc app=leetcode id=53 lang=cpp
 *
 * [53] Maximum Subarray
 */

#include <vector>
#include <algorithm>
using namespace std;

// @lc code=start
class Solution {
public:
    /*
    int maxSubArray(vector<int>& nums) {
        int maxSubArray = INT_MIN;
        int acc = INT_MIN;
        for (int num: nums) {
            if (acc > 0) {
                acc += num;
            } 
            else {
                acc = num;
            }
            if (acc > maxSubArray) maxSubArray = acc;
        }
        return maxSubArray;
    }
    */
    int maxSubArray(vector<int>& nums) {
        int *dp = new int[nums.size()];
        int output = dp[0] = nums[0];
        for (int i = 1; i < nums.size(); ++i) {
            dp[i] = max(dp[i-1] + nums[i], nums[i]);
            output = max(output, dp[i]);
        }
        return output;
    }
};
// @lc code=end

