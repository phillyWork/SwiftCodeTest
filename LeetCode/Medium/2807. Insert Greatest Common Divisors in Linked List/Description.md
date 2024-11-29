Given the head of a linked list head, in which each node contains an integer value.

Between every pair of adjacent nodes, insert a new node with a value equal to the greatest common divisor of them.

Return the linked list after insertion.

The greatest common divisor of two numbers is the largest positive integer that evenly divides both numbers.

`Constraints`
- The number of nodes in the list is in the range [1, 5000].
- 1 <= Node.val <= 1000

`Examples`
|Input|Output|
|:-:|:-:|
|[18,6,10,3]|[18,6,6,2,10,1,3]|
|[7]|[7]|

![ex1_copy](https://github.com/user-attachments/assets/f85b0a27-c3a9-43fa-8d39-3303c0b7941a)

Explanation 1)
- We insert the greatest common divisor of 18 and 6 = 6 between the 1st and the 2nd nodes.
- We insert the greatest common divisor of 6 and 10 = 2 between the 2nd and the 3rd nodes.
- We insert the greatest common divisor of 10 and 3 = 1 between the 3rd and the 4th nodes.
- There are no more adjacent nodes, so we return the linked list.

![ex2_copy1](https://github.com/user-attachments/assets/e3f4abe4-e6a3-450d-a5ed-c63150ad0ef1)

Explanation 2)
- There are no pairs of adjacent nodes, so we return the initial linked list.
