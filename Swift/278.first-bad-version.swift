/*
 * @lc app=leetcode id=278 lang=swift
 *
 * [278] First Bad Version
 */

// @lc code=start
/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {

    // T.C. = O(logN)
    // S.C. = O(1)
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1
        var last = n

        while start < last {
            let mid = (start + last) / 2
            
            let isMidBadVersion = isBadVersion(mid)

            if isMidBadVersion {
                last = mid
            } else {
                start = mid + 1
            }
        }

        return start
    }
}
// @lc code=end

