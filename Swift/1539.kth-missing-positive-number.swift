/*
 * @lc app=leetcode id=1539 lang=swift
 *
 * [1539] Kth Missing Positive Number
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var missingNumbers = [Int]()
        var extraNums = Set<Int>()
        
        for i in 0..<arr.count {
            var expect = i + 1
            if arr[i] != expect {
                if !extraNums.contains(expect) {
                    missingNumbers.append(expect)
                }
                
                extraNums.insert(arr[i])
            }
        }

        var nextMissingNum = arr.count + 1
        while missingNumbers.count < k {
            if !extraNums.contains(nextMissingNum) {
                missingNumbers.append(nextMissingNum)
            }
            nextMissingNum += 1
        }
        return missingNumbers[k - 1]
    }
}
// @lc code=end

