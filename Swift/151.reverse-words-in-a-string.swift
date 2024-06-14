/*
 * @lc app=leetcode id=151 lang=swift
 *
 * [151] Reverse Words in a String
 */

// @lc code=start
class Solution {

    // T.C. = O(N)
    // S.C. = O(1)
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }

    // T.C. = O(N)
    // S.C. = O(N)
    // func reverseWords(_ s: String) -> String {

    
    //     var ss = Array(s)
    //     var words = [String]()
        
    //     var word = ""
    //     for i in ss.indices {
    //         if ss[i] == " ", word.count > 0 {
    //             words.append(word)
    //             word = ""
    //         }
    //         else if ss[i] != " " {
    //             word.append(ss[i])
    //         }
    //     }

    //     if word.count > 0 {
    //         words.append(word)
    //     }

    //     words.reverse()
        
    //     return words.joined(separator: " ")
    // }
}
// @lc code=end

