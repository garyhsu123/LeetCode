/*
 * @lc app=leetcode id=307 lang=cpp
 *
 * [307] Range Sum Query - Mutable
 */
#include <vector>
using namespace std;

// @lc code=start
// class NumArray {
// public:
//     vector<int>v; //vector to store input vector.
//     int sum; //sum of all element of vector 
//     NumArray(vector<int>& nums) {
//         v=nums;
//         sum=0;
//         for(int i=0;i<nums.size();i++){
//             sum+=nums[i];
//         }
//     }
    
//     void update(int index, int val) {
//         sum-=v[index];     //subtract old element  from sum at index and then update by adding new element val.
//         v[index]=val;
//         sum+=val;
        
//     }
    
//     int sumRange(int left, int right) {
//         int res=sum; 
//         for(int i=0;i<left;i++){    //subtract all element before left and after right
//             res-=v[i];
//         }
//         for(int i=right+1;i<v.size();i++){
//             res-=v[i];
//         }
//         return res;// return res ie. our answer.
//     }
// };

class NumArray {
public:
    int *BIT;
    vector<int> globalNums;
    NumArray(vector<int>& nums) {
        BIT = new int[nums.size()+1];
        globalNums = nums;
        for (int i = 0; i <= nums.size(); ++i) {
            BIT[i] = 0;
        }

        for (int i = 0; i < nums.size(); ++i) {
            updateBIT(i, nums[i]);
        }
    }
    
    void update(int index, int val) {
        updateBIT(index, val - globalNums[index]);
        globalNums[index] = val;
    }

    void updateBIT(int index, int diff) {
        int BITID = index + 1;
        while (BITID <= globalNums.size())
        {
            BIT[BITID] += diff;
            BITID += (BITID & (-BITID));
        }
    }
    
    int sumRange(int left, int right) {
        return sumRange(right) - sumRange(left-1);
    }

    int sumRange(int index) {
        int BITID = index + 1;
        int sum = 0;
        while (BITID > 0)
        {
            sum += BIT[BITID];
            BITID -= (BITID & (-BITID));
        }
        return sum;
    }
};

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray* obj = new NumArray(nums);
 * int param_1 = obj->sumRange(left,right);
 */
// @lc code=end

