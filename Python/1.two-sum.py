#
# @lc app=leetcode id=1 lang=python3
#
# [1] Two Sum
#

# @lc code=start
class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        memory = dict()

        for i, number in enumerate(nums):
            complement = target - number
            if complement in memory:
                return [memory[complement], i]
            memory[number] = i
# @lc code=end
