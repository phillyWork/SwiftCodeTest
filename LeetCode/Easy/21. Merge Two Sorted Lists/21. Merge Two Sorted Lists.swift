import Foundation

// recursive call
// compare current nodes of list1 and list2

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        if list1!.val < list2!.val {
            // list1's value is smaller, so it should be the next node in the merged list
            list1!.next = mergeTwoLists(list1!.next, list2)
            // return list1 as current head of merged list
            return list1
        } else {
            // list2's value is smaller or equal, so it should be the next node in the merged list
            list2!.next = mergeTwoLists(list2!.next, list1)
            // return list2 as current head of merged list
            return list2
        }
    }
}

// merge into a new linked list

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // Dummy node to simplify edge cases
        let dummy = ListNode(0)
        var current = dummy
        var l1 = list1
        var l2 = list2
        
        // Iterate through both lists
        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                current.next = node1
                l1 = node1.next
            } else {
                current.next = node2
                l2 = node2.next
            }
            current = current.next!
        }
        
        // Append the remaining nodes of l1 or l2
        if let remaining = l1 {
            current.next = remaining
        } else if let remaining = l2 {
            current.next = remaining
        }
        
        // Return the merged list starting from dummy's next
        return dummy.next
    }
}
