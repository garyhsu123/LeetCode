/*
 * @lc app=leetcode id=114 lang=cpp
 *
 * [114] Flatten Binary Tree to Linked List
 */

#include <iostream>
using namespace std;
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
    TreeNode *lastNode = nullptr;
    void flatten(TreeNode* root) {
        if (root == NULL) return;
        flatten(root->right);
        flatten(root->left);
        root->right = lastNode;
        root->left = nullptr;
        lastNode = root;
    }

    
};
// @lc code=end

