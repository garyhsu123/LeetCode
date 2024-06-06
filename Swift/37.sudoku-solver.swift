/*
 * @lc app=leetcode id=37 lang=swift
 *
 * [37] Sudoku Solver
 */

// @lc code=start
class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        _ = isValidSudoku(i: 0, j: 0, &board) 
    }

    func isValidSudoku(i: Int, j: Int, _ board: inout [[Character]]) -> Bool {
        if i >= 9 || j >= 9 { return true }
        var digit = board[i][j]
        if digit != "." { 
            var nextJ = (j+1)%9
            var nextI = (nextJ == 0) ? i+1 : i
            return isValidSudoku(i: nextI, j: nextJ, &board)
        }

        for digit in 1...9 {
            let cDigit = Character("\(digit)")
            if (isPermitted(digit: cDigit, i: i, j: j, toBoard: board)) {
                board[i][j] = cDigit
                var nextJ = (j+1)%9
                var nextI = (nextJ == 0) ? i+1 : i
                var isValid = isValidSudoku(i: nextI, j: nextJ, &board)
                if isValid { return true }
                board[i][j] = "."
            }
        }
        return false
    }

    func isPermitted(digit: Character, i: Int, j: Int, toBoard: [[Character]]) -> Bool {
        for col in 0..<9 {
            if toBoard[i][col] == digit { return false }
        }
        for row in 0..<9 {
            if toBoard[row][j] == digit { return false }
        }
        for row in 0..<3 {
            for col in 0..<3 {
                if toBoard[3*(i/3)+row][3*(j/3)+col] == digit { return false }
            }
        }
        return true
    }
}
// @lc code=end

