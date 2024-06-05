/*
 * @lc app=leetcode id=36 lang=swift
 *
 * [36] Valid Sudoku
 */

// @lc code=start
class Solution {
    
    // T.C. = O(N^2)
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if (!isValidCell(i: i, j: j, toBoard: board)) { return false }
            }
        }
        return true
    }

    func isValidCell(i: Int, j: Int, toBoard: [[Character]]) -> Bool {
        let digit = toBoard[i][j]
        if digit == "." { return true }
        
        for col in j+1..<9 {
            if toBoard[i][col] == digit { return false }
        }
        for row in i+1..<9 {
            if toBoard[row][j] == digit { return false }
        }
        for row in 0..<3 {
            for col in 0..<3 {
                let row = 3*(i/3)+row
                let col = 3*(j/3)+col
                if toBoard[row][col] == digit, row != i, col != j { return false }
            }
        }
        return true
    }

    // func isValidSudoku(_ board: [[Character]]) -> Bool {
    //     var board = board
    //     return isValidSudoku(i: 0, j: 0, &board) 
    // }

    // func isValidSudoku(i: Int, j: Int, _ board: inout [[Character]]) -> Bool {
    //     print("solve: (\(i), \(j)))")
    //     if i >= 9 || j >= 9 { return true }
    //     var digit = board[i][j]
    //     if digit != "." { 
    //         var nextJ = (j+1)%9
    //         var nextI = (nextJ == 0) ? i+1 : i
    //         return isValidSudoku(i: nextI, j: nextJ, &board)
    //     }

    //     for digit in 1...9 {
    //         let cDigit = Character("\(digit)")
    //         if (isPermitted(digit: cDigit, i: i, j: j, toBoard: board)) {
    //             board[i][j] = cDigit
    //             var nextJ = (j+1)%9
    //             var nextI = (nextJ == 0) ? i+1 : i
    //             var isValid = isValidSudoku(i: nextI, j: nextJ, &board)
    //             if isValid { return true }
    //             board[i][j] = "."
    //         }
    //     }
    //     return false
    // }

    // func isPermitted(digit: Character, i: Int, j: Int, toBoard: [[Character]]) -> Bool {
    //     for col in 0..<9 {
    //         if toBoard[i][col] == digit { return false }
    //     }
    //     for row in 0..<9 {
    //         if toBoard[row][j] == digit { return false }
    //     }
    //     for row in 0..<3 {
    //         for col in 0..<3 {
    //             if toBoard[3*(i/3)+row][3*(j/3)+col] == digit { return false }
    //         }
    //     }
    //     return true
    // }
}
// @lc code=end

