/*
 * @lc app=leetcode id=284 lang=swift
 *
 * [284] Peeking Iterator
 */

// @lc code=start
// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    var iterator: IndexingIterator<Array<Int>>
    var last: Int?

    init(_ arr: IndexingIterator<Array<Int>>) {
        self.iterator = arr
        self.last = iterator.next()
    }
    
    func next() -> Int {
        defer {
            last = iterator.next()
        }
        return self.last ?? 0
    }
    
    func peek() -> Int {
        return last ?? 0
    }
    
    func hasNext() -> Bool {
        return self.last != nil
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */
// @lc code=end

