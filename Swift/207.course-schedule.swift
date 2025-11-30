/*
 * @lc app=leetcode id=207 lang=swift
 *
 * [207] Course Schedule
 */

// @lc code=start
class Solution {
    // Kahn's algorithm
    // func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    //     var graph: [Int: [Int]] = [:]
    //     var inDegree: [Int] = [Int](repeating: 0, count: numCourses)

    //     for prerequisiteMap in prerequisites {
    //         let course = prerequisiteMap[0]
    //         let prerequisite = prerequisiteMap[1]
    //         graph[prerequisite, default: []].append(course)
    //         inDegree[course] += 1
    //     }

    //     var queue: [Int] = []
    //     for (i, degree) in inDegree.enumerated() {
    //         if degree == 0 {
    //             queue.append(i)
    //         }
    //     }

    //     var topologicalOrder: [Int] = []
    //     while !queue.isEmpty {
    //         let current = queue.removeFirst()
    //         topologicalOrder.append(current)

    //         for neighbor in graph[current, default: []] {
    //             inDegree[neighbor] -= 1
    //             if inDegree[neighbor] == 0 {
    //                 queue.append(neighbor)
    //             }
    //         }
    //     }

    //     return topologicalOrder.count == numCourses
    // }

    // DFS
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph: [Int: [Int]] = [:]
        for prerequisiteMap in prerequisites {
            let course = prerequisiteMap[1]
            let prerequisite = prerequisiteMap[0]
            graph[prerequisite, default: []].append(course)
        }

        var visited: [Int] = [Int](repeating: 0, count: numCourses)
        for course in 0..<numCourses {
            guard dfs(course: course, graph: graph, visited: &visited) else {
                return false
            }
        }
        return true
    }


    func dfs(course: Int, graph: [Int: [Int]], visited: inout [Int]) -> Bool {
        if visited[course] == 1 { return false } 
        if visited[course] == 2 { return true }

        visited[course] = 1

        for neighbor in graph[course, default: []] {
            guard dfs(course: neighbor, graph: graph, visited: &visited) else {
                return false
            }
        }

        visited[course] = 2
        
        return true
    }
}
// @lc code=end

