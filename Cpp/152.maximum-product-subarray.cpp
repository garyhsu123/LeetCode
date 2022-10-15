/*
 * @lc app=leetcode id=152 lang=cpp
 *
 * [152] Maximum Product Subarray
 */
#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    
    /*
    int maxProduct(vector<int>& nums) {
        if (nums.size() == 1) return nums.front();
        int maxProduct = INT_MIN;
        
        int positive = 0;
        int negative = 0;

        for (int num: nums) {
            if (num == 0) positive = negative = 0;
            else if (num > 0) {
                positive = (positive == 0) ? num : positive * num;
                if (negative > 0) negative *= num;
            }
            else {
                swap(positive , negative);
                positive *= -num;
                negative  = (negative == 0) ? -num : negative * -num;
            }

            maxProduct = max(maxProduct, positive);
        }
        return maxProduct;
    }
    */

    int maxProduct(vector<int>& nums) {
        int maxProduct = nums[0];
        int leftMax = 0, rightMax = 0;
        for (int i = 0; i < nums.size(); ++i) {
            leftMax = (leftMax ? leftMax : 1) * nums[i];
            rightMax = (rightMax ? rightMax : 1) * nums[nums.size() - 1 - i];
            maxProduct = max(maxProduct, max(leftMax, rightMax));
        }
        return maxProduct;
    }
};
// @lc code=end

