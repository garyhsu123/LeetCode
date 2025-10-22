/*
 * @lc app=leetcode id=39 lang=swift
 *
 * [39] Combination Sum
 */

// @lc code=start
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []

        resolve(candidates, result: &result, temp: [], startIndex: 0, target: target)

        return result
    }

    func resolve(_ candidates: [Int], result: inout [[Int]], temp: [Int], startIndex: Int, target: Int) {
        if target == 0 {
            result.append(temp)
            return
        } else if target < 0 {
            return
        }

        guard startIndex < candidates.count else {
            return
        }

        var snapshot: [Int] = temp
        for i in startIndex..<candidates.count {
            if candidates[i] > target {
                continue
            }
            snapshot.append(candidates[i])
            resolve(candidates, result: &result, temp: snapshot, startIndex: i, target: target - candidates[i])
            snapshot.popLast()
        }
    }
}
// @lc code=end

