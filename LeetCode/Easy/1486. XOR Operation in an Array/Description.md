You are given an integer n and an integer start.

Define an array nums where nums[i] = start + 2 * i (0-indexed) and n == nums.length.

Return the bitwise XOR of all elements of nums.

`Constraints`
- 1 <= n <= 1000
- 0 <= start <= 1000
- n == nums.length

`Example`
|Input|Output|
|:-:|:-:|
|n = 5, start = 0|8|
|n = 4, start = 3|8|


Example #1 Explanation)
- Array nums is equal to [0, 2, 4, 6, 8] where (0 ^ 2 ^ 4 ^ 6 ^ 8) = 8.
- Where "^" corresponds to bitwise XOR operator.

Example #2 Explanation)
- Array nums is equal to [3, 5, 7, 9] where (3 ^ 5 ^ 7 ^ 9) = 8.
