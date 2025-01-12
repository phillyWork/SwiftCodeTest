You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

`Constraints`
- The number of nodes in both lists is in the range [0, 50].
- -100 <= Node.val <= 100
- Both list1 and list2 are sorted in non-decreasing order.

`Example`
|Input|Output|
|:-:|:-:|
|list1 = [1,2,4], list2 = [1,3,4]|[1,1,2,3,4,4]|
|list1 = [], list2 = []|[]|
|list1 = [], list2 = [0]|[0]|
