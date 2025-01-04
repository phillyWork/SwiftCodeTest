Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

`Constraints`
- 2 <= nums.length <= 104
- -109 <= nums[i] <= 109
- -109 <= target <= 109
- Only one valid answer exists.
  
`Example`
|Input|Output|
|:-:|:-:|
|nums = [2,7,11,15], target = 9|[0,1]|
|nums = [3,2,4], target = 6|[1,2]|
|nums = [3,3], target = 6|[0,1]|

Example #1 Explanation)
- Because nums[0] + nums[1] == 9, we return [0, 1].
