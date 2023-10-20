
/*
 * @lc app=leetcode id=1269 lang=swift
 *
 * [1269] Number of Ways to Stay in the Same Place After Some Steps
 */

// @lc code=start
class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        if (arrLen == 1) { return 1 }
        var farDistance = (steps < arrLen) ? steps + 1 : arrLen
        var arr = [Int].init(repeating: 0, count: farDistance)
        arr[0] = 1
        arr[1] = 1

        for i in 2...steps {
            var tmp = 0
            for j in 0..<farDistance {
                var a = tmp + getArr(arr: &arr, index: j) + getArr(arr: &arr, index: j+1)
                tmp = getArr(arr: &arr, index: j)
                arr[j] = a % (1000_000_007)
            }
          
        }
    
        return arr[0]
    }

    func getArr(arr: inout [Int], index: Int) -> Int {
        if index < 0 { return 0 }
        else if index >= arr.count { return 0 }
        else { return arr[index] }
    }
}
// @lc code=end