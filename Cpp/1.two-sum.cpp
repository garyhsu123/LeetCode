/*
 * @lc app=leetcode id=1 lang=cpp
 *
 * [1] Two Sum
 */

using namespace std;
#include <map>
#include <vector>
// @lc code=start
// T.C. = O(N)
// S.C. = O(N)
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> numMap;
        for (int i = 0; i < nums.size(); i++) {
            int counterpart = target - nums[i];
            if (numMap.find(counterpart) != numMap.end()) {
                return {numMap[counterpart], i};
            }
            numMap[nums[i]] = i;
        }
        
        return {};
    }
};
// @lc code=end

