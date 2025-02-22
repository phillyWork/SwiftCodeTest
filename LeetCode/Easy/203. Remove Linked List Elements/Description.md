Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

`Constraints`
- The number of nodes in the list is in the range [0, 104].
- 1 <= Node.val <= 50
- 0 <= val <= 50

`Example`
|Input|Output|
|:-:|:-:|
|head = [1,2,6,3,4,5,6], val = 6|[1,2,3,4,5]|
|head = [], val = 1|[]|
|head = [7,7,7,7], val = 7|[]|
