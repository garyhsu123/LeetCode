/*
 * @lc app=leetcode id=165 lang=swift
 *
 * [165] Compare Version Numbers
 */

// @lc code=start
class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var normalizedVersion1 = versionArray(version: version1)
        var normalizedVersion2 = versionArray(version: version2)
        
        if normalizedVersion1.count < normalizedVersion2.count {
            normalizedVersion1.append(contentsOf: [Int].init(repeating: 0, count: normalizedVersion2.count - normalizedVersion1.count))
        }
        else if normalizedVersion1.count > normalizedVersion2.count {
            normalizedVersion2.append(contentsOf: [Int].init(repeating: 0, count: normalizedVersion1.count - normalizedVersion2.count))
        }

        for (v1, v2) in zip(normalizedVersion1, normalizedVersion2) {
            if v1 > v2 { return 1 }
            else if v1 < v2 { return -1 }
        }

        return 0

    }

    func versionArray(version: String) -> [Int] {
        return version.split(separator: ".").map(
            { subSequence -> Int in
                guard let firstNonZero = subSequence.firstIndex(where: { $0 != "0" } ) else {
                    return 0
                }
                return Int(String(subSequence[firstNonZero...])) ?? 0
            }
        )
    }
}
// @lc code=end

