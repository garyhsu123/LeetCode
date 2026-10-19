#
# @lc app=leetcode id=113 lang=python3
#
# [113] Path Sum II
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: TreeNode | None, targetSum: int) -> list[list[int]]:
        answer = list()

        if root is None:
            return []

        stack = list()

        def dfs(node, acc_sum):
            if node is None:
                return

            stack.append(node.val)
            acc_sum += node.val

            if node.left is None and node.right is None and acc_sum == targetSum:
                answer.append(stack.copy())
            else:                
                dfs(node.left, acc_sum)
                dfs(node.right, acc_sum)

            stack.pop()
            acc_sum -= node.val

        dfs(root, 0)

        return answer
        
# @lc code=end

