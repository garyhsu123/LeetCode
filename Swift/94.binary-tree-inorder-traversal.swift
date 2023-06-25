/*
 * @lc app=leetcode id=94 lang=swift
 *
 * [94] Binary Tree Inorder Traversal
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var cur: TreeNode? = root
        var stack = [TreeNode?]()
        var ans = [Int]()
        
        while cur != nil || !stack.isEmpty {
            while cur != nil {
                stack.append(cur)
                cur = cur?.left
            }

            if let node = stack.removeLast() {
                ans.append(node.val)
                cur = node.right
            }
        }

        return ans
    }
}

/// Solution 2
// class Solution {
//     func inorderTraversal(_ root: TreeNode?) -> [Int] {
//         guard let root = root else {
//             return []
//         }

//         var answer: [Int] = []
//         answer.append(contentsOf: inorderTraversal(root.left))
//         answer.append(root.val)
//         answer.append(contentsOf: inorderTraversal(root.right))
//         return answer
//     }
// }
// @lc code=end

