Given the head of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

`Constraints`
- The number of nodes in the list is in the range [1, 100].
- 1 <= Node.val <= 100

`Example`
|Input|Output|
|:-:|:-:|
|head = [1,2,3,4,5]|[3,4,5]|
|head = [1,2,3,4,5,6]|[4,5,6]|

Explanation #1)
- ![lc-midlist1](https://github.com/user-attachments/assets/5083c959-2c33-41ca-8074-699f0a9d0480)
- The middle node of the list is node 3.

Explanation #2)
- ![lc-midlist2](https://github.com/user-attachments/assets/36be36ff-66b2-4cde-bd37-0d7987f3cdd9)
- Since the list has two middle nodes with values 3 and 4, we return the second one.
