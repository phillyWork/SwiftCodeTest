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

// check value of next node
// only move on when value is not equal to val

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {

        guard head != nil else { return nil }

        var start = ListNode(0)
        start.next = head
        var current: ListNode? = start

        while current?.next != nil {
            if current?.next?.val == val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }

        return start.next
    }
}


// work as recursive
// call function with next value to check

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard let head = head else { return nil }
    head.next = removeElements(head.next, val)
    return head.val == val ? head.next : head
}
