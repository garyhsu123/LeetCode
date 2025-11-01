/*
 * @lc app=leetcode id=480 lang=swift
 *
 * [480] Sliding Window Median
 */

// @lc code=start

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

class Solution {

    // T.C. = O(N * logk)
    // S.C. = O(N)
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var res: [Double] = []
        var dict: [Int: Int] = [:]

        var maxHeap = PriorityQueue<Int>(sort: >)
        var minHeap = PriorityQueue<Int>(sort: <)
// 0, 1, 2 ,3, 4
        for i in 0..<nums.count {
            var balance = 0
            
            if (maxHeap.count + minHeap.count) < k {
                minHeap.enqueue(nums[i])
            } else {
                let valueToRemove = nums[i - k]
                dict[valueToRemove, default: 0] += 1

                if let minValue = minHeap.peek, valueToRemove >= minValue {
                    balance -= 1
                } else {
                    balance += 1
                }

                if let minValue = minHeap.peek, nums[i] >= minValue {
                    balance += 1
                    minHeap.enqueue(nums[i])
                } else {
                    balance -= 1
                    maxHeap.enqueue(nums[i])
                }
            }

            guard (maxHeap.count + minHeap.count) >= k else {
                continue
            }

            if i == k - 1 {
                while true {
                    if minHeap.count - maxHeap.count > 1, let minValue = minHeap.dequeue() {
                        maxHeap.enqueue(minValue)
                    } else {
                        break
                    }
                }
            } else {
                if balance > 0 {
                    maxHeap.enqueue(minHeap.dequeue()!)
                } else if balance < 0 {
                    minHeap.enqueue(maxHeap.dequeue()!)
                }
            }

while let minValue = minHeap.peek, let tbr = dict[minValue], tbr > 0 {
                minHeap.dequeue()
                dict[minValue] = tbr - 1
            } 

            while let maxValue = maxHeap.peek, let tbr = dict[maxValue], tbr > 0 {
                maxHeap.dequeue()
                dict[maxValue] = tbr - 1
            } 

            

            if k % 2 == 1, let minValue = minHeap.peek {
                let median = Double(minValue)
                res.append(median)
            } else if k % 2 == 0, let maxValue = maxHeap.peek, let minValue = minHeap.peek {
                let median = (Double(maxValue) + Double(minValue)) / 2
                res.append(median)
            }



        }



        return res
    }
}
// @lc code=end

