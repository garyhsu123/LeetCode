/*
 * @lc app=leetcode id=257 lang=swift
 *
 * [257] Binary Tree Paths
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

    // Recurrsive
    // T.C.= O(N)
    // S.C.= O(N)
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let node = root else {
            return []
        }

        if root?.left == nil, root?.right == nil {
            return ["\(node.val)"]
        }

        var paths: [String] = []
        let leftPaths = binaryTreePaths(node.left) 
        for leftPath in leftPaths {
            paths.append("\(node.val)->\(leftPath)")
        }
        
        let rightPaths = binaryTreePaths(node.right)
        for rightPath in rightPaths {
            paths.append("\(node.val)->\(rightPath)")
        }

        return paths
    }
}
// @lc code=end

