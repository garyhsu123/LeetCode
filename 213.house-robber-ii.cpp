/*
 * @lc app=leetcode id=213 lang=cpp
 *
 * [213] House Robber II
 */
#include <iostream>
#include <vector>
using namespace std;
// @lc code=start
class Solution {
public:
    int rob(vector<int>& nums) {
        if (nums.size() == 1) return nums.front();
        else if (nums.size() == 2) return max(nums.front(), nums.back());
        
        vector<int> selectFirst(nums.begin() + 2, nums.end() - 1);
        vector<int> notSelectFirst(nums.begin() + 1, nums.end());
        
        return max(nums[0] + robHelper(selectFirst), robHelper(notSelectFirst));
    }

    int robHelper(vector<int>& nums) {
        if (nums.size() == 0) return 0;

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

