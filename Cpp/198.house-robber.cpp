/*
 * @lc app=leetcode id=198 lang=cpp
 *
 * [198] House Robber
 */
#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    int rob(vector<int>& nums) {
        int select = nums.front(), nonSelect = 0;
        for (int i = 1; i < nums.size(); ++i) {
            int newNonSelect = max(select, nonSelect);
            int newSelect = nonSelect + nums[i];select = newSelect;
            nonSelect = newNonSelect;
        }
        return max(select, nonSelect);
    }
};
// @lc code=end

