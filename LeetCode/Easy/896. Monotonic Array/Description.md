An array is monotonic if it is either monotone increasing or monotone decreasing.

An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. 

An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

Given an integer array nums, return true if the given array is monotonic, or false otherwise.

`Constraints`
- 1 <= nums.length <= 105
- -105 <= nums[i] <= 105
 
`Example`
|Input|Output|
|:-:|:-:|
|nums = [1,2,2,3]|true|
|nums = [6,5,4,4]|true|
|nums = [1,3,2]|false|
