/*
 * @lc app=leetcode id=106 lang=swift
 *
 * [106] Construct Binary Tree from Inorder and Postorder Traversal
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

    // T.C. = O(N)
    // S.C. = O(N)
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var index: [Int: Int] = [:]
        for (i, value) in inorder.enumerated() {
            index[value] = i
        }

        return helper(inorder, postorder, inorderLow: 0, inorderHigh: inorder.count - 1, postOrderLow: 0, postOrderHigh: postorder.count - 1, indexMap: index)
    }

    func helper(_ inorder: [Int], _ postorder: [Int], inorderLow: Int, inorderHigh: Int, postOrderLow: Int, postOrderHigh: Int, indexMap: [Int: Int]) -> TreeNode? {
        
        guard inorderLow <= inorderHigh, postOrderLow <= postOrderHigh else { return nil }
        let rootVal = postorder[postOrderHigh]

        guard let rootIndexInInorder = indexMap[rootVal] else { return nil }

        let rightCount = inorderHigh - rootIndexInInorder
        let leftCount = rootIndexInInorder - inorderLow

        let root = TreeNode(rootVal)
        root.left = helper(inorder, postorder, inorderLow: inorderLow, inorderHigh: rootIndexInInorder - 1, postOrderLow: postOrderLow, postOrderHigh: postOrderHigh - 1 - rightCount, indexMap: indexMap)
        root.right = helper(inorder, postorder, inorderLow: rootIndexInInorder + 1, inorderHigh: inorderHigh, postOrderLow: postOrderHigh - rightCount, postOrderHigh: postOrderHigh - 1, indexMap: indexMap)
        return root
    }
}
// @lc code=end

