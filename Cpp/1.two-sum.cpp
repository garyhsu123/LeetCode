/*
 * @lc app=leetcode id=1 lang=cpp
 *
 * [1] Two Sum
 */

using namespace std;
#include <vector>

// @lc code=start
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int a, b;
        for (int i = 0; i < nums.size()-1; ++i) {
            for (int j = i + 1; j < nums.size(); ++j) {
                if (nums[i] + nums[j] == target)
                    return vector<int> {i, j};
            }
        }
        return vector<int>{};
    }
};
// @lc code=end

