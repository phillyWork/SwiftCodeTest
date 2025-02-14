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

// check whether values are already included via Set
// check both current and previous nodes to pass and link next

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var values: Set<Int> = []
        var current = head
        var previous = head
        var start = previous

        while current != nil {
            if values.contains(current!.val) {
                previous!.next = current!.next
            } else {
                values.insert(current!.val)
                previous = current
            }
            current = current!.next
        }

        return start
    }
}


// use last as new linked list to use only current node

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var last: ListNode?
        
        while current != nil {
            if last != nil && current!.val == last!.val {
                last?.next = current?.next
            } else {
                last = current
            }
            current = current?.next
        }
        return head
    }
}


// check with head only
// create new node everytime for linking next

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var actual: ListNode? = head
        
        while (actual != nil) {
            var newNext: ListNode? = actual?.next
            while (newNext != nil && newNext!.val == actual!.val) {
                newNext = newNext?.next
            }
            actual?.next = newNext
            actual = actual?.next
        }
        return head
    }
}
