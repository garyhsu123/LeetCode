/*
 * @lc app=leetcode id=149 lang=swift
 *
 * [149] Max Points on a Line
 */

// @lc code=start
class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        var maxPoints = 1
        var lineMap: [Double: Int] = [:]

        for i in 0..<points.count - 1 {
            lineMap.removeAll()
            for j in i+1..<points.count {
                let point0 = points[i]
                let point1 = points[j]

                var slope: Double

                if (point0[0] == point1[0]) {
                    slope = Double.infinity
                }
                else {
                    var dy: Int = point1[1] - point0[1]
                    var dx: Int = point1[0] - point0[0]
                    let gcd: Int = gcd(a: dx, b: dy)
                    if gcd != 0 {
                        dy /= gcd
                        dx /= gcd
                    }
                    slope = Double(dy) / Double(dx)
                }
            
                var  pointsOfLine = lineMap[slope] ?? 1
                pointsOfLine += 1
                lineMap[slope] = pointsOfLine

                maxPoints = max(maxPoints, pointsOfLine)
            }
        }
        return maxPoints
    }

    func gcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return gcd(a: b, b: a % b)
    }
}
// @lc code=end

