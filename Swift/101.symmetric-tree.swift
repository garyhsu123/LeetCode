/*
 * @lc app=leetcode id=101 lang=swift
 *
 * [101] Symmetric Tree
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
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var stack = [TreeNode?]()

        if root?.left == nil, root?.left?.val == root?.right?.val {
            return true
        }

        stack.append(contentsOf: [root?.left, root?.right])

        while !stack.isEmpty {
            let left = stack.removeLast()
            let right = stack.removeLast()

            if left == nil, right == nil {
                continue
            }
            else if left?.val != right?.val {
                return false
            }
            
            stack.append(contentsOf: [left?.left, right?.right, left?.right, right?.left])

        }

        return true
    }
}

/// Solution 2
// class Solution {
//     func isSymmetric(_ root: TreeNode?) -> Bool {
//         return isSymmetric(root?.left, root?.right)
//     }
    
//     func isSymmetric(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
//         if lhs == nil, rhs == nil {
//             return true
//         }
//         else if lhs?.val != rhs?.val {
//             return false
//         }

//         return isSymmetric(lhs?.left, rhs?.right) && isSymmetric(lhs?.right, rhs?.left)
//     }
    
// }
// @lc code=end

