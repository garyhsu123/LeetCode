/*
 * @lc app=leetcode id=103 lang=swift
 *
 * [103] Binary Tree Zigzag Level Order Traversal
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var result: [[Int]] = []

        var queue: [TreeNode] = []
        queue.append(root)
        var leftToRight = true

        while(queue.count > 0) {
            let queueCount = queue.count

            var levelOrder: [Int] = []
            for i in 0..<queueCount {
                levelOrder.append(queue[i].val)
                if let leftNode = queue[i].left {
                    queue.append(leftNode)
                }
                if let rightNode = queue[i].right {
                    queue.append(rightNode)
                }
            }

            if !leftToRight {
                levelOrder.reverse()
            }

            result.append(levelOrder)
            queue.removeFirst(queueCount)
            leftToRight = !leftToRight
        }

        return result
    }
}
// @lc code=end

