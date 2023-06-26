/*
 * @lc app=leetcode id=111 lang=swift
 *
 * [111] Minimum Depth of Binary Tree
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { 
        self.val = 0; self.left = nil; self.right = nil; 
    }
    public init(_ val: Int) { 
        self.val = val; self.left = nil; self.right = nil; 
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

/// Solution 1
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 
        }

        if root?.left != nil, root?.right == nil { return minDepth(root?.left) + 1}
        else if root?.right != nil, root?.left == nil { return minDepth(root?.right) + 1}
        else {
            return min(minDepth(root?.left) + 1, minDepth(root?.right) + 1)
        }
    }


}

/// Solution 2
// class Solution {
//     func minDepth(_ root: TreeNode?) -> Int {
//         if root == nil {
//             return 0
//         }

//         var depth = 0
//         var queue: [TreeNode?] = [root]

//         while !queue.isEmpty {
//             depth += 1

//             var childNodes = [TreeNode?]()
//             for i in 0 ..< queue.count {
                
//                 if queue[i]?.left == nil, queue[i]?.right == nil {
//                     return depth
//                 }
//                 if queue[i]?.left != nil {
//                     childNodes.append(contentsOf: [queue[i]?.left])
//                 }
//                 if queue[i]?.right != nil {
//                     childNodes.append(contentsOf: [queue[i]?.right])
//                 }
//             }
//             queue = childNodes
//         }
//         return depth
//     }
// }
// @lc code=end

