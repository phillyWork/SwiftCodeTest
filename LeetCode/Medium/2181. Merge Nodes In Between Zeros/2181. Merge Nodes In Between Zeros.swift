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


// loop through head only once
// add up values until facing up zero
// create a new node and insert into next node with added up values

class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var result = ListNode(0, nil)
        var resultPtr = result
        
        var start = head?.next
        var tempSum = 0

        while start != nil {
            if start?.val == 0 {
                resultPtr.next = ListNode(tempSum, nil)
                tempSum = 0
                resultPtr = resultPtr.next!
            } else {
                tempSum += start!.val
            }
            start = start?.next
        }

        result = result.next!

        return result
    }
}


// improvement
// instead of setting next as nil, just setup values (default value of next: nil)
// return next as final
 
class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var resultPtr = dummy
        var current = head?.next
        var tempSum = 0

        while let node = current {
            if node.val == 0 {
                resultPtr.next = ListNode(tempSum)
                resultPtr = resultPtr.next!
                tempSum = 0
            } else {
                tempSum += node.val
            }
            current = node.next
        }

        return dummy.next
    }
}


// using only head itself
// check with current and nextNode to move up

class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var current = head
        var nextNode = head?.next
        var sum: Int = 0
        
        while (nextNode != nil) {
            if let notZeroValue = nextNode?.val, notZeroValue != 0  {
                sum += notZeroValue
            } else {
                current = current?.next
                current?.val = sum
                sum = 0
            }
            nextNode = nextNode?.next
        }
        current?.next = nil
        return head?.next
    }
}
