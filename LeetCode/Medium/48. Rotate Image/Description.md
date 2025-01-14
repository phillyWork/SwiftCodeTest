You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

`Constraints`
- n == matrix.length == matrix[i].length
- 1 <= n <= 20
- -1000 <= matrix[i][j] <= 1000

`Example`
|Input|Output|
|:-:|:-:|
|matrix = [[1,2,3],[4,5,6],[7,8,9]]|[[7,4,1],[8,5,2],[9,6,3]]|
|matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]|[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]|

Example #1)

![mat1](https://github.com/user-attachments/assets/f199db14-ee07-4c49-9e1e-3ebc637728d7)

Example #2)

![mat2](https://github.com/user-attachments/assets/dbce4700-a371-459f-83a4-8e67a1f8d06c)
