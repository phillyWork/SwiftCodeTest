Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

Return the array in the form [x1,y1,x2,y2,...,xn,yn].

`Constraints`
- 1 <= n <= 500
- nums.length == 2n
- 1 <= nums[i] <= 10^3

`Example`
|Input|Output|
|:-:|:-:|
|nums = [2,5,1,3,4,7], n = 3|[2,3,5,4,1,7]|
|nums = [1,2,3,4,4,3,2,1], n = 4|[1,4,2,3,3,2,4,1]|
|nums = [1,1,2,2], n = 2|[1,2,1,2]|

Example #1 Explanation)
- Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
