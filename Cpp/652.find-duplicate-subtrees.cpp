/*
 * @lc app=leetcode id=652 lang=cpp
 *
 * [652] Find Duplicate Subtrees
 */
#include <vector>
using namespace std;
#include <string>
#include <iostream>
#include <unordered_map>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};
 

// @lc code=start
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    vector<TreeNode*> findDuplicateSubtrees(TreeNode* root) {
        vector<TreeNode *> answer;
        unordered_map<string, int> dict;
        inOrderEncode(root, answer, dict);
        return answer;
    }

    string inOrderEncode(TreeNode *node, vector<TreeNode *> &ans, unordered_map<string, int> &dict) {
        if (node == NULL) {
            return "";
        }

        string str = "(" + inOrderEncode(node->left, ans, dict) + to_string(node->val) + inOrderEncode(node->right, ans, dict) + ")";

        if (dict[str] == 1) {
            ans.push_back(node);
        } 
        dict[str]++;
        return str;
    }
};
// @lc code=end

