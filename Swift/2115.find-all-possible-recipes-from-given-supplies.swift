/*
 * @lc app=leetcode id=2115 lang=swift
 *
 * [2115] Find All Possible Recipes from Given Supplies
 */

// @lc code=start
class Solution {

    // Kahn's algorithm
    // T.C.= O(N + E)
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var graph: [String: [String]] = [:]
        var inDegree: [String: Int] = [:]
        for (i, recipe) in recipes.enumerated() {
            for ingredient in ingredients[i] {
                graph[ingredient, default: []].append(recipe)
                inDegree[recipe, default: 0] += 1
            }
        }

        var queue = supplies
        var results: [String] = []
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if recipes.contains(current) {
                results.append(current)
            }

            for neighbor in graph[current, default: []] {
                inDegree[neighbor, default: 0] -= 1
                if inDegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }
    
        return results
    }
}
// @lc code=end

