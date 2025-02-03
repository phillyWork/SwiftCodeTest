import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */


// same node: (total - n)th from head == nth from last

// 1. check total nodes count
// 2. move to node that is right before the node to be removed
// 3. update next

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 0
        var temp = head

        while temp != nil {
            temp = temp!.next
            count += 1
        }

        var i = 0
        temp = head
        while i < count - n - 1 {
            temp = temp!.next
            i += 1
        }

        // check for head case
        if count == n {
            temp = head!.next
            return temp
        }

        if let toBeRemoved = temp!.next {
            if let toBeNext = toBeRemoved.next {
                temp!.next = toBeNext
                toBeRemoved.next = nil
            } else {
                // no next: node to be removed is the last node
                temp!.next = nil
            }
        } else {
            // only one node, nothing to return
            return nil
        }

        return head
    }
}



// Follow up: Could you do this in one pass?

// use two nodes to loop only one time

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head) // add dummy node to cover removing head node case
        var first: ListNode? = dummy
        var second: ListNode? = dummy

        // 1 ~ k nodes
        // nth from end == (k-n)th from head
        
        // move first (n+1)th times --> same effect: from head, move nth times (that node: n+1th node including head)
        for _ in 0...n {
            first = first?.next
        }

        // move first and second till first is nil
        // move (k-n)th times
        
        // first: from nth node, moved (k-n)th times --> totally moved kth from head, which is nil
        
        // second: from -1th node (dummy, which is before the head)
        // moved (k-n)th times --> at the node that is right before the node to be removed: (k-n-1)
        
        while first != nil {
            first = first?.next
            second = second?.next
        }

        // link second's next to node to be removed's next
        second?.next = second?.next?.next

        // return head
        return dummy.next
    }
}
