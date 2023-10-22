/*
 * @lc app=leetcode id=341 lang=swift
 *
 * [341] Flatten Nested List Iterator
 */

// @lc code=start
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    var nestedList: [NestedInteger]
    var index: Int
    var nextIterator: NestedIterator?
    var nextNestedInteger: NestedInteger? {
        get {
            if index >= nestedList.count { return nil }
            return nestedList[index]
        }
    }

    init(_ nestedList: [NestedInteger]) {
        self.nestedList = nestedList
        self.index = 0

        
    }
    
    func next() -> Int {
        if let nextIterator = nextIterator {
            return nextIterator.next()
        }
        if let nextNestedInteger = nextNestedInteger {
            if nextNestedInteger.isInteger() { 
                let next = nextNestedInteger.getInteger()
                index += 1
                return next
            }
        }
        return 0
    }
    
    func hasNext() -> Bool {
        if let nextIterator = nextIterator {
            let hasNext = nextIterator.hasNext()
            if (hasNext) { return true }
            self.nextIterator = nil
            index += 1
        }

        while true {
            guard let nextNestedInteger = nextNestedInteger else {
                return false
            }

            if nextNestedInteger.isInteger() { return true }
            else {
                let nextIterator = NestedIterator(nextNestedInteger.getList())
                self.nextIterator = nextIterator
                let hasNext = nextIterator.hasNext()
                if (hasNext) { return true }
                self.nextIterator = nil
                index += 1
            }
        }
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
// @lc code=end

