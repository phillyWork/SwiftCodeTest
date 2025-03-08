You are given a string s and an integer array indices of the same length. 

The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.

Return the shuffled string.

`Constraints`
- s.length == indices.length == n
- 1 <= n <= 100
- s consists of only lowercase English letters.
- 0 <= indices[i] < n
- All values of indices are unique.

`Example`
|Input|Output|
|:-:|:-:|
|s = "codeleet", indices = [4,5,6,7,0,2,1,3]|"leetcode"|
|s = "abc", indices = [0,1,2]|"abc"|

Example #1 Explanation)
- ![q1](https://github.com/user-attachments/assets/9d3f83b0-95e0-4585-9681-4a60a0edb141)
- As shown, "codeleet" becomes "leetcode" after shuffling.

Example #2 Explanation)
- After shuffling, each character remains in its position.
