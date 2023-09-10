/*
 * @lc app=leetcode id=112 lang=swift
 *
 * [112] Path Sum
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

/// Solution 1
/// Recursion
//  class Solution {
//     func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//         guard let root = root else {
//             return false
//         }

//         if let leftChild = root.left, let rightChild = root.right {
//             return hasPathSum(leftChild, targetSum - root.val) || hasPathSum(rightChild, targetSum - root.val)
//         }
//         else if let leftChild = root.left {
//             return hasPathSum(leftChild, targetSum - root.val)
//         }
//         else if let rightChild = root.right {
//             return hasPathSum(rightChild, targetSum - root.val)
//         }
//         else {
//             return root.val == targetSum
//         }
//     }
// }

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }

        var visited = [TreeNode]()
        var dfs = [TreeNode]()
        dfs.append(root)
        var target = targetSum

        while dfs.count > 0 {
            let node = dfs.last!
            if visited.contains(where: {$0 === node}) {
                target += node.val
                dfs.popLast()
                continue
            }

            visited.append(node)
            target -= node.val

            if let leftChild = node.left, let rightChild = node.right {
                dfs.append(contentsOf: [leftChild, rightChild])
            }
            else if let leftChild = node.left {
                dfs.append(leftChild)
            }
            else if let rightChild = node.right {
                dfs.append(rightChild)
            }
            else {
                if target == 0 {
                    return true
                }
            }
        }

        return false
    }
}
// @lc code=end

