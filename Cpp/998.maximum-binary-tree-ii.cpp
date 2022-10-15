/*
 * @lc app=leetcode id=998 lang=cpp
 *
 * [998] Maximum Binary Tree II
 */


 
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
    TreeNode* insertIntoMaxTree(TreeNode* root, int val) {
       if (root == nullptr) return new TreeNode(val);

        if (root->val < val) {
            return new TreeNode(val, root, nullptr);
        }
        else {
            root->right = insertIntoMaxTree(root->right, val);
        }
        return root;
    }

    /*
    TreeNode* insertIntoMaxTree(TreeNode* root, int val) {
        TreeNode *parent = nullptr;
        TreeNode *cur = root;
        while (cur != nullptr && val < cur->val)
        {
            parent = cur;
            cur = cur->right;
        }

        if (parent == nullptr) {
            return new TreeNode(val, root, nullptr);
        }
        else if (cur == nullptr) {
            parent->right = new TreeNode(val);
            return root;
        }
        else {
            parent->right = new TreeNode(val, cur, nullptr);
            return root;
        }
    }
    */
};

// @lc code=end

