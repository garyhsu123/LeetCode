/*
 * @lc app=leetcode id=240 lang=swift
 *
 * [240] Search a 2D Matrix II
 */

// @lc code=start
class Solution {
    // BFS
    // T.C.= O(M x N)
    // S.C.= O(M x N)
    // func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    //     let maxRow = matrix.count
    //     let maxCol = matrix[0].count

    //     var queue: [(Int, Int)] = []
    //     queue.append((0, 0))

    //     while !queue.isEmpty {
    //         let roundCandidatesNum = queue.count
    //         var lastNewCandidate = (-1, -1)

    //         for i in 0..<roundCandidatesNum {
    //             let candidate = queue[i]
    //             let row = candidate.0
    //             let col = candidate.1
                
    //             if (matrix[row][col] == target) { return true }
    //             else if matrix[row][col] > target { continue }

    //             if row + 1 < maxRow, (lastNewCandidate.0 != row + 1 || lastNewCandidate.1 != col) {
    //                 let belowCandidate = (row + 1, col)
    //                 queue.append(belowCandidate)
    //                 lastNewCandidate = belowCandidate
    //             }

    //             if col + 1 < maxCol, (lastNewCandidate.0 != row || lastNewCandidate.1 != col + 1) {
    //                 let rightCandidate = (row, col + 1)
    //                 queue.append(rightCandidate)
    //                 lastNewCandidate = rightCandidate
    //             }
    //         }

    //         queue.removeFirst(roundCandidatesNum)
    //     }

    //     return false
    // }

    // Binary Serach
    // T.C.= O(nlogm)
    // S.C.= O(nlogm)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for row in matrix {
            if binarySerach(row, target) {
                return true
            }
        }
        return false
    }

    func binarySerach(_ array: [Int], _ target: Int) -> Bool {
        var start = 0
        var end = array.count - 1

        while start <= end {
            let mid = (start + end) / 2
            let midValue = array[mid]

            if midValue == target {
                return true
            } else if midValue <= target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        } 
        return false     
    }
}
// @lc code=end

