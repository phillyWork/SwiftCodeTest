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

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fastNode = head
        var slowNode = head
        
        while fastNode != nil && fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        
        return slowNode
    }
}


// improvement: set fast and slow as tuple
// check only fast.next is nil

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var (fast,slow) = (head, head)
        
        while(fast?.next != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
}
