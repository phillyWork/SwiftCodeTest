Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

`Constraints`
- The number of nodes in the tree is in the range [1, 104].
- 1 <= Node.val <= 105

`Example`
|Input|Output|
|:-:|:-:|
|root = [1,null,2,null,3,null,4,null,null]|[2,1,3,null,null,null,4]|
|root = [2,1,3]|[2,1,3]|

Example #1 Explanation)
- ![balance1-tree](https://github.com/user-attachments/assets/17e424d4-91fc-492d-8638-bd610760bf62)
- This is not the only correct answer, [3,1,4,null,2] is also correct.

Example #2 Explanation)
- ![balanced2-tree](https://github.com/user-attachments/assets/2c705925-b5ff-4f87-9747-022174f1299c)
