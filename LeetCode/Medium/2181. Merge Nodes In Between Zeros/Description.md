You are given the head of a linked list, which contains a series of integers separated by 0's. The beginning and end of the linked list will have Node.val == 0.

For every two consecutive 0's, merge all the nodes lying in between them into a single node whose value is the sum of all the merged nodes. The modified list should not contain any 0's.

Return the head of the modified linked list.

`Constraints`
- The number of nodes in the list is in the range [3, 2 * 105].
- 0 <= Node.val <= 1000
- There are no two consecutive nodes with Node.val == 0.
- The beginning and end of the linked list have Node.val == 0.

`Example`
|Input|Output|
|:-:|:-:|
|head = [0,3,1,0,4,5,2,0]|[4,11]|
|head = [0,1,0,3,0,2,2,0]|[1,3,4]|

Example #1 Explanation)
- ![ex1-1](https://github.com/user-attachments/assets/9324d537-47b9-4bda-b002-14d2ec8fcc9a)
- The above figure represents the given linked list. The modified list contains
  - The sum of the nodes marked in green: 3 + 1 = 4.
  - The sum of the nodes marked in red: 4 + 5 + 2 = 11.

Example #2 Explanation) 
- ![ex2-1](https://github.com/user-attachments/assets/f6165a16-97ab-4264-a5ca-f30fc0a78643)
- The above figure represents the given linked list. The modified list contains
  - The sum of the nodes marked in green: 1 = 1.
  - The sum of the nodes marked in red: 3 = 3.
  - The sum of the nodes marked in yellow: 2 + 2 = 4.
