/*
 * @lc app=leetcode id=2491 lang=swift
 *
 * [2491] Divide Players Into Teams of Equal Skill
 */

// @lc code=start
class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        let sortedSkill = skill.sorted()
        var skillEachTeam = -1
        var chemistry = 0

        for i in 0..<sortedSkill.count / 2 {
            let memberOne = sortedSkill[i]
            let memberTwo = sortedSkill[sortedSkill.count - 1 - i]
            let roundOfSkills = memberOne + memberTwo
            chemistry += memberOne * memberTwo

            if i == 0 {
                skillEachTeam = roundOfSkills
                continue
            }

            if skillEachTeam != roundOfSkills { return -1 }
        }
        return chemistry
    }
}
// @lc code=end

