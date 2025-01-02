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


// compare each from start and end til there's nothing left to compare

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        var back = head
        var front = head?.next
        
        var stack = [head!]
        
        //checking node count
        while front != nil {
            
            //at the end, even case
            front = front?.next
            if front == nil {
                back = back?.next
                break
            }
            
            //at the end, odd case
            front = front?.next
            if front == nil {
                back = back?.next?.next
                break
            }
            
            //saving back
            back = back?.next
            stack.append(back!)
        }
        
        //pop from back
        while !stack.isEmpty {
            let last = stack.removeLast()
            //not equal, not palindrome
            if back!.val != last.val {
                return false
            }
            back = back?.next
        }
        
        return true
    }
}

// Follow up: Could you do it in O(n) time and O(1) space?

// find middle of linked list: use fast and slow pointer approach ~ split the list
// reverse second half of list
// compare two halves

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return true
        }
        
        // Step 1: Find the middle of the list
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // Step 2: Reverse the second half of the list
        var secondHalfStart = reverseList(slow?.next)
        var firstHalfStart = head
        
        // Step 3: Compare the two halves
        var isPalindrome = true
        var p1 = firstHalfStart
        var p2 = secondHalfStart
        while p2 != nil {
            if p1?.val != p2?.val {
                isPalindrome = false
                break
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        
        // Step 4: Restore the second half of the list (optional)
        //slow?.next = reverseList(secondHalfStart)
        
        return isPalindrome
    }
    
    private func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current = head
        // next will be prev
        while current != nil {
            // saving for next node
            let nextTemp = current?.next
            current?.next = prev
            prev = current
            current = nextTemp
        }
        return prev
    }
}
