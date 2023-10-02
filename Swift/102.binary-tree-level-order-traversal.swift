/*
 * @lc app=leetcode id=102 lang=swift
 *
 * [102] Binary Tree Level Order Traversal
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var ans = [[Int]]()
        var q: [TreeNode] = [root]

        while !q.isEmpty {
            var levelAns = [Int]()
            for _ in 0 ..< q.count {
                let node = q.removeFirst()
                levelAns.append(node.val)
                if let leftNode = node.left { q.append(leftNode) }
                if let rightNode = node.right { q.append(rightNode) }
            }
            ans.append(levelAns)
        }

        return ans
    }
}
// @lc code=end

