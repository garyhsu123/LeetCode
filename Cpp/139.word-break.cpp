/*
 * @lc app=leetcode id=139 lang=cpp
 *
 * [139] Word Break
 */
#include <string>
#include <vector>
#include <unordered_set>
using namespace std;
// @lc code=start
class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        unordered_set<string> set;
        for (string s: wordDict) {
            set.insert(s);
        }

        int strIdx = 0;
        int len = 1;
        for (int i = 0; i < s.size(); ++i) {
            if (set.find(s.substr(strIdx)) != set.end()) return true;
            if (set.find(s.substr(strIdx, len)) != set.end()) {
                strIdx = strIdx + len;
                len = 1;
            } else {
                len++;
            }
        }
        return false;
    }
};
// @lc code=end

