/*
 * @lc app=leetcode id=1567 lang=cpp
 *
 * [1567] Maximum Length of Subarray With Positive Product
 */
#include <vector>
using namespace std;
// @lc code=start
class Solution {
public:
    void swap(int &a, int &b) {
        int tmp = a;
        a = b;
        b = tmp;
    }

    int getMaxLen(vector<int>& nums) {
        int maxLen = INT_MIN;
        
        int positiveN = 0;
        int negativeN = 0;

        for (int num: nums) {
            if (num == 0) positiveN = negativeN = 0; 
            else if (num < 0) {
                swap(positiveN, negativeN);
                negativeN++;
                if (positiveN > 0) positiveN++;
            }
            else {
                positiveN++;
                if (negativeN > 0) negativeN++;
            }
            
            maxLen = max(maxLen, positiveN); 
        }
        return maxLen;
    }
};
// @lc code=end

