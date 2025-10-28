/*
 * @lc app=leetcode id=105 lang=swift
 *
 * [105] Construct Binary Tree from Preorder and Inorder Traversal
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
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

    // T.C. = O(N^2)
    // S.C. = O(N^2)
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let rootVal = preorder.first else { return nil }

        guard let rootValIndexInInorder = inorder.firstIndex(of: rootVal) else { return nil }

        let rootNode = TreeNode(rootVal)
        rootNode.left = buildTree(Array(preorder[1..<(rootValIndexInInorder + 1)]), Array(inorder[..<rootValIndexInInorder]))
        rootNode.right = buildTree(Array(preorder[(rootValIndexInInorder + 1)...]), Array(inorder[(rootValIndexInInorder + 1)...]))
        return rootNode
    }
}
 
// @lc code=end

