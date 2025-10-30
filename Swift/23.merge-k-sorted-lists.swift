/*
 * @lc app=leetcode id=23 lang=swift
 *
 * [23] Merge k Sorted Lists
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0
        self.next = nil
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
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

struct PriorityQueue<Element> {
    private var heap: [Element]
    private let areSorted: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.areSorted = sort
        self.heap = elements
        buildHeap()
    }

    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var peek: Element? { heap.first }

    mutating func enqueue(_ element: Element) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }

    mutating func dequeue() -> Element? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        siftDown(from: 0)
        return element
    }

    private mutating func buildHeap() {
        for i in stride(from: (heap.count / 2 - 1), through: 0, by: -1) {
            siftDown(from: i)
        }
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && areSorted(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < heap.count && areSorted(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && areSorted(heap[right], heap[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// T.C. = O(NlogN)
// S.C. = O(N)

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let nodes: [Int] = lists.reduce(into: []) { partialResult, listNode in 
            var cur = listNode
            while let node = cur {
                partialResult.append(node.val)
                cur = node.next
            } 
            
        }

        var queue = PriorityQueue<Int>(sort: <, elements: nodes)

        let firstValue = queue.dequeue()
        let root: ListNode? = (firstValue != nil) ? ListNode(firstValue!) : nil
        
        var currentNode = root
        while let nextValue: Int = queue.dequeue() {
            currentNode?.next = ListNode(nextValue)
            currentNode = currentNode?.next
        }

        return root
    }
}
// @lc code=end

