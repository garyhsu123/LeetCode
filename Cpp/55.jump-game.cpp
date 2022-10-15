/*
 * @lc app=leetcode id=55 lang=cpp
 *
 * [55] Jump Game
 */

#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    bool canJump(vector<int>& nums) {
        int farIdx = 0;
        for (int i = 0; i <= farIdx && i < nums.size() - 1; ++i) {
            int far = i + nums[i];
            if (farIdx < far) {
                farIdx = far;
            }
        }
        return (farIdx >= nums.size()-1);
    }
};
// @lc code=end

