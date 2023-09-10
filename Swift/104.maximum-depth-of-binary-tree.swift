/*
 * @lc app=leetcode id=104 lang=swift
 *
 * [104] Maximum Depth of Binary Tree
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
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        var maxDepth = 0
        var nextLevelNodes = [TreeNode]()
        nextLevelNodes.append(root)

        while nextLevelNodes.count > 0 {
            maxDepth += 1

            for _ in 0 ..< nextLevelNodes.count {
                let node = nextLevelNodes.removeFirst()
                if let leftChild = node.left {
                    nextLevelNodes.append(leftChild)
                }
                if let rightChild = node.right {
                    nextLevelNodes.append(rightChild)
                }
            }
        }
        return maxDepth
    }
}
// @lc code=end

