/*
 * @lc app=leetcode id=918 lang=cpp
 *
 * [918] Maximum Sum Circular Subarray
 */
#include <vector>
using namespace std;
// @lc code=start
class Solution {
public:
    int maxSubarraySumCircular(vector<int>& nums) {
        int sum = 0;
        int maxSub = INT_MIN;
        int acc = INT_MIN;
        for (int num: nums) {
            sum += num;
            if (acc > 0) {
                acc += num;
            } 
            else {
                acc = num;
            }
            maxSub = max(acc, maxSub);
        }

        int minSub = INT_MAX;
        acc = INT_MAX;
        for (int num: nums) {
            if (acc > 0) {
                acc = num;
            } 
            else {
                acc += num;
            }
            minSub = min(acc, minSub);
        }

        return max(maxSub, sum - minSub ?: maxSub);

    }
};
// @lc code=end

