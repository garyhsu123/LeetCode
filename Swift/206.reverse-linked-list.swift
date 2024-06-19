/*
 * @lc app=leetcode id=206 lang=swift
 *
 * [206] Reverse Linked List
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }    
}

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {

    // iteratively
    // func reverseList(_ head: ListNode?) -> ListNode? {
    //     var ans: ListNode? = head
    //     var tmp = head?.next
    //     ans?.next = nil

    //     while let nextRoot = tmp {
    //         tmp = tmp?.next
    //         nextRoot.next = ans
    //         ans = nextRoot
    //     }

    //     return ans
    // }

    // recursively
    // func reverseList(_ head: ListNode?) -> ListNode? {
    //     guard let leaf = head?.next else {
    //         return head
    //     }
    //     head?.next = nil
    //     var newRoot = reverseList(leaf)
    //     leaf.next = head   
    //     return newRoot
    // }
}
// @lc code=end

