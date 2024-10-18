/*
 * @lc app=leetcode id=207 lang=swift
 *
 * [207] Course Schedule
 */

// @lc code=start
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int: Set<Int>]()
        buildGraph(prerequisites, graph: &graph)
        //print(graph)
        return !checkIfCycle(numCourses, graph: graph)
    }

    func buildGraph(_ prerequisites: [[Int]], graph: inout [Int: Set<Int>]) {
        for edge in prerequisites {
            let target = edge[0]
            let dependent = edge[1]

            var dependents = graph[target] ?? Set<Int>()
            dependents.insert(dependent)
            
            graph[target] = dependents
        }
    }

    private func checkIfCycleUtil(nodeIndex: Int, graph: [Int: Set<Int>], visited: inout [Bool], recStack: inout [Bool]) -> Bool {
        //print("nodeIndex: \(nodeIndex)")
        if visited[nodeIndex] { return false }
        
        visited[nodeIndex] = true
        recStack[nodeIndex] = true

        guard let adjs = graph[nodeIndex] else {
            recStack[nodeIndex] = false
            return false
        }

        for adj in adjs {
            if recStack[adj] || checkIfCycleUtil(nodeIndex: adj, graph: graph, visited: &visited, recStack: &recStack) {
                return true
            }
        }
        recStack[nodeIndex] = false
        return false
    }

    func checkIfCycle(_ numCourses: Int, graph: [Int: Set<Int>]) -> Bool {
        var visited = [Bool].init(repeating: false, count: numCourses)
        var recStack = [Bool].init(repeating: false, count: numCourses)

        while let beginNodeIndex = graph.first(where: { key, value in !visited[key] })?.key {
            //print("beginNodeIndex: \(beginNodeIndex)")
            if checkIfCycleUtil(nodeIndex: beginNodeIndex, graph: graph, visited: &visited, recStack: &recStack) {
                return true
            }
        }
        return false
    }
}
// @lc code=end

