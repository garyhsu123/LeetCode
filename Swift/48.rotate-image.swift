/*
 * @lc app=leetcode id=48 lang=swift
 *
 * [48] Rotate Image
 */

// @lc code=start
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        transpose(&matrix)
        reverse(&matrix)
    }

    func transpose(_ matrix: inout [[Int]]) {
        for row in matrix.indices {
            for col in matrix[row].indices {
                if col >= row { break }
                var tmp = matrix[row][col]
                matrix[row][col] = matrix[col][row]
                matrix[col][row] = tmp
            }
        }
    }

    func reverse(_ matrix: inout [[Int]]) {
        for row in matrix.indices {
            for col in matrix[row].indices {
                if col >= matrix[row].count / 2 { break }
                var tmp = matrix[row][col]
                matrix[row][col] = matrix[row][matrix[row].count - 1 - col]
                matrix[row][matrix[row].count - 1 - col] = tmp
            }
        }
    }
}
// @lc code=end

