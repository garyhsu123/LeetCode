/*
 * @lc app=leetcode id=237 lang=swift
 *
 * [237] Delete Node in a Linked List
 */
 
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        if let nextNode = node?.next {
            node?.val = nextNode.val
            node?.next = nextNode.next      
        }
    }
}
// @lc code=end

