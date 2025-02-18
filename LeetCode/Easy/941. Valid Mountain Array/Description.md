Given an array of integers arr, return true if and only if it is a valid mountain array.

Recall that arr is a mountain array if and only if:
- arr.length >= 3
- There exists some i with 0 < i < arr.length - 1 such that:
- arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
- arr[i] > arr[i + 1] > ... > arr[arr.length - 1]


![hint_valid_mountain_array](https://github.com/user-attachments/assets/4bed3a56-eb2a-4a49-add3-a04aae675551)


`Constraints`
- 1 <= arr.length <= 104
- 0 <= arr[i] <= 104

`Example`
|Input|Output|
|:-:|:-:|
|arr = [2,1]|false|
|arr = [3,5,5]|false|
|arr = [0,3,2,1]|true|
