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
    func recoverTree(_ root: TreeNode?) {
        var inOrder = inOrder(root)
        var sorted = inOrder.sorted()
        var index = 0
        recover(root, sorted: sorted, index: &index)
    }

    func recover(_ root: TreeNode?, sorted: [Int], index: inout Int) {
        guard let root else { return }
        recover(root.left, sorted: sorted, index: &index)
        root.val = sorted[index]
        index += 1
        recover(root.right, sorted: sorted, index: &index)   
    }

    func inOrder(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }

        var inOrderNodes: [Int] = []
        inOrderNodes += inOrder(root.left)
        inOrderNodes += [root.val]
        inOrderNodes += inOrder(root.right)
        return inOrderNodes
    }
}
// @lc code=end

