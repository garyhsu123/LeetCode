/*
 * @lc app=leetcode id=21 lang=swift
 *
 * [21] Merge Two Sorted Lists
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

    // T.C. = O(m+n)
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        
        if list1 == nil {
            return list2
        }
        else if list2 == nil {
            return list1
        }

        var ans: ListNode? = nil
        var cur: ListNode? = nil

        while let smallNode = getSmallNodeAndMoveOn(list1: &list1, list2: &list2) {
            
            

            if ans == nil { 
                ans = smallNode
                cur = ans
            }
            else {
                cur?.next = smallNode
                cur = cur?.next
            }
        }

        return ans
    }

    func getSmallNodeAndMoveOn(list1: inout ListNode?, list2: inout ListNode?) -> ListNode? {
        if var tList1 = list1, var tList2 = list2 {
            if tList1.val <= tList2.val {
                let node = ListNode(tList1.val, tList1.next)
                list1 = list1?.next
                return node
            }
            else {
                let node = ListNode(tList2.val, tList2.next)
                list2 = list2?.next
                return node
            }
        }
        else if var tList1 = list1 {
            let node = ListNode(tList1.val, tList1.next)
            list1 = list1?.next
            return node 
        }
        else if var tList2 = list2 {
            let node = ListNode(tList2.val, tList2.next)
            list2 = list2?.next
            return node
        }
        else {
            return nil
        }
    }
}
// @lc code=end

