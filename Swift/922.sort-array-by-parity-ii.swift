/*
 * @lc app=leetcode id=922 lang=swift
 *
 * [922] Sort Array By Parity II
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(N)
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var nums = nums
        var nextEvenIndex = 0, nextOddIndex = 1
        while nextEvenIndex < nums.count, nextOddIndex < nums.count {
            if nums[nextEvenIndex].isEven {
                nextEvenIndex += 2
            } else if nums[nextOddIndex].isOdd {
                nextOddIndex += 2
            } else {
                nums.swapAt(nextEvenIndex, nextOddIndex)
            }
        } 

        return nums
    }
}
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}
// @lc code=end

