/*
 * @lc app=leetcode id=236 lang=swift
 *
 * [236] Lowest Common Ancestor of a Binary Tree
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if let p = p, root.val == p.val { return p }
        if let q = q, root.val == q.val { return q }
        
        var l = lowestCommonAncestor(root.left, p, q)
        var r = lowestCommonAncestor(root.right, p, q)
        if l != nil && r != nil { return root }
        else if l != nil { return l }
        else { return r }
    }
}
// @lc code=end

