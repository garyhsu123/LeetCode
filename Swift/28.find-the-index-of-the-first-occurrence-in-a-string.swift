/*
 * @lc app=leetcode id=28 lang=swift
 *
 * [28] Find the Index of the First Occurrence in a String
 */

// @lc code=start
class Solution {

    // func strStr(_ haystack: String, _ needle: String) -> Int {
    //     guard let firstIndex = haystack.firstRange(of: needle)?.lowerBound else {
    //         return -1
    //     }
    //     return haystack.distance(from: haystack.startIndex, to: firstIndex) 
    // }

    // T.C. = O(N)
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        let haystackChars = Array(haystack)
        let needleChars = Array(needle)

        for i in 0 ..< haystackChars.count - needleChars.count + 1 {
            var match = 0
            for j in 0 ..< needleChars.count {
                if needleChars[j] != haystackChars[i+j] { break }
                match += 1
            }
            if match == needleChars.count { return i }
        }
        return -1
    }
}
// @lc code=end

