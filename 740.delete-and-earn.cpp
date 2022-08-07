/*
 * @lc app=leetcode id=740 lang=cpp
 *
 * [740] Delete and Earn
 */
#include <vector>
#include <unordered_map>
#include <iostream>
using namespace std;
// @lc code=start
class Solution {
public:
    int deleteAndEarn(vector<int>& nums) {
        unordered_map<int, int> map;
        for (int i: nums) {
           map[i]+=i;
        }

        int select = 0, nonSelect = 0;
        for (int i = 1; i <= 10000; ++i) {
            int newSelect = nonSelect + map[i];
            int newNonSelect = max(select, nonSelect);
            select = newSelect;
            nonSelect = newNonSelect;
        }

        return max(select, nonSelect);
    }

};
// @lc code=end

