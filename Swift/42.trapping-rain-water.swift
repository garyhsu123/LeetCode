/*
 * @lc app=leetcode id=42 lang=swift
 *
 * [42] Trapping Rain Water
 */

// @lc code=start
class Solution {
    // T.C. = O(N)
    // S.C. = O(N)
    // func trap(_ height: [Int]) -> Int {
    //     var leftHeight = Array(repeating: 0, count: height.count)
    //     var rightHeight = Array(repeating: 0, count: height.count)

    //     for i in 1..<height.count {
    //         leftHeight[i] = max(leftHeight[i-1], height[i-1])
    //         rightHeight[height.count-1-i] = max(rightHeight[height.count-i], height[height.count-i])
    //     }

    //     var amount = 0
    //     for i in 0..<height.count {
    //         let containerHeightLevel = min(leftHeight[i], rightHeight[i])
    //         if height[i] >= containerHeightLevel { continue }
    //         amount += (containerHeightLevel - height[i])
    //     }
    //     return amount

    // T.C. = O(N)
    // S.C. = O(1)
    func trap(_ height: [Int]) -> Int {
        var leftMax = -1
        var rightMax = -1
        var leftIndex = 0
        var rightIndex = height.count - 1
        var amount = 0

        while leftIndex <= rightIndex {
            if leftMax < rightMax {
                leftMax = max(leftMax, height[leftIndex])
                amount += leftMax - height[leftIndex]
                leftIndex += 1
            }
            else {
                rightMax = max(rightMax, height[rightIndex])
                amount += rightMax - height[rightIndex]            
                rightIndex -= 1
            }
        }

        return amount
    }
}
// @lc code=end

