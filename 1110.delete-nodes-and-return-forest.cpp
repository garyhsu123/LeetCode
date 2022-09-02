/*
 * @lc app=leetcode id=1110 lang=cpp
 *
 * [1110] Delete Nodes And Return Forest
 */

#include <vector>
#include <set>

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
    vector<TreeNode*> ans;
    set<int> toDelete;
    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        for (auto num: to_delete) {
            toDelete.insert(num);
        }
        helper(root);
        if (toDelete.find(root->val) == toDelete.end()) {
            ans.push_back(root);
        }
        return ans;
    }

    TreeNode *helper(TreeNode* node) {
        if (node == NULL) return NULL;
        
        node->left = helper(node->left);
        node->right = helper(node->right);

        if (toDelete.find(node->val) != toDelete.end()) {
            if (node->left) {
                ans.push_back(node->left);
            }
            if (node->right) {
                ans.push_back(node->right);
            }
            return NULL;
        }


        return node;
       
    }
};
// @lc code=end

