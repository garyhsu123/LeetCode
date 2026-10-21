#
# @lc app=leetcode id=124 lang=python3
#
# [124] Binary Tree Maximum Path Sum
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxPathSum(self, root: TreeNode | None) -> int:
        max_sum = float("-inf")

        def dfs(node):
            nonlocal max_sum
            
            if node is None:
                return 0

            left_sum = max(0, dfs(node.left))
            right_sum = max(0, dfs(node.right))

            connected_sum = left_sum + node.val + right_sum
            max_sum = max(max_sum, connected_sum)

            not_conntected_sum = max(left_sum, right_sum) + node.val
            max_sum = max(max_sum, not_conntected_sum)

            return not_conntected_sum
        
        dfs(root)

        return max_sum
# @lc code=end

