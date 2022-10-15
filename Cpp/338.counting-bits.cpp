/*
 * @lc app=leetcode id=338 lang=cpp
 *
 * [338] Counting Bits
 */
#include <iostream>
#include <vector>
using namespace std;

// @lc code=start
class Solution {
public:
    // O(NlogN)
    // vector<int> countBits(int n) {
    //     vector<int> ans;
    //     for (int i = 0; i <= n; ++i) {
    //         int target = i;
    //         int numZero = 0;
    //         while(target) {
    //             target -= target & -target;
    //             numZero++;
    //         }
    //         ans.push_back(numZero);
    //     }
    //     return ans;
    // }

    // O(N)
    vector<int> countBits(int n) {
        int *dp = new int[n+1];
        dp[0] = 0;
        for (int i = 1; i <= n; ++i) {
            dp[i] = (i % 2) ? dp[i/2]+1 : dp[i/2];
        }
        return vector<int>(dp,dp+n+1);
    }
};
// @lc code=end

