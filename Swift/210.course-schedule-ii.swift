/*
 * @lc app=leetcode id=210 lang=swift
 *
 * [210] Course Schedule II
 */

// @lc code=start
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = [Int: [Int]]()
        var inDegree = [Int](repeating: 0, count: numCourses)

        for prerequisiteMap in prerequisites {
            let course = prerequisiteMap[0]
            let prerequisite = prerequisiteMap[1]
            graph[prerequisite, default: []].append(course)
            inDegree[course] += 1
        }

        var result = [Int]()
        var queue = [Int]()
        for (i, inDegree) in inDegree.enumerated() {
            if inDegree == 0 {
                queue.append(i)
            }
        }

        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current)

            for neighbor in graph[current, default: []] {
                inDegree[neighbor] -= 1
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        guard result.count == numCourses else {
            return []
        }

        return result
    }
}
// @lc code=end

