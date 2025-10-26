/*
 * @lc app=leetcode id=99 lang=swift
 *
 * [99] Recover Binary Search Tree
 */

 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var firstNode: TreeNode?
    var secondNode: TreeNode?
    var preNode = TreeNode(Int.min)

    // T.C. = O(N)
    // S.C. = O(1)
    func recoverTree(_ root: TreeNode?) {
        traverse(root)

        if let firstNode, let secondNode {
            let firstNodeValue = firstNode.val
            firstNode.val = secondNode.val
            secondNode.val = firstNodeValue
        }
    }

    func traverse(_ node: TreeNode?) {
        guard let node else { return }

        traverse(node.left)

        if firstNode == nil, preNode.val > node.val { 
            firstNode = preNode
            secondNode = node
        }
        else if firstNode != nil, preNode.val > node.val { secondNode = node }
        preNode = node

        traverse(node.right)
    }
}
// @lc code=end

