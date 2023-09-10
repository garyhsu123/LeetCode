/*
 * @lc app=leetcode id=744 lang=swift
 *
 * [744] Find Smallest Letter Greater Than Target
 */

// @lc code=start

/// Solution 1
/// Binary Search
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    
        if letters.last!.asciiValue! <= target.asciiValue! { return letters.first! }
        else if letters.first!.asciiValue! > target.asciiValue! { return letters.first! }

        var start = 0
        var end = letters.count - 1

        while start <= end {
            let mid = (start + end) / 2
            if letters[mid].asciiValue! > target.asciiValue! + 1 {
                end = mid-1
            }
            else if letters[mid].asciiValue! < target.asciiValue! + 1 {
                start = mid+1
            }
            else {
                return letters[mid]
            }
        }
        return letters[start]
    }
}
/// Solution 2
/// Brute Force
// class Solution {
//     func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    
//         for c in letters {
//             if c.asciiValue! > target.asciiValue! {
//                 return c
//             }
//         }
//         return letters.first!
//     }
// }
// @lc code=end

