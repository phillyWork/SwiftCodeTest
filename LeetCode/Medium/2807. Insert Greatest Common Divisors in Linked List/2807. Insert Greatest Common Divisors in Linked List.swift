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


// Singly Linked List: only check one way link

// Step 1. set start position (insert)
// Step 2. check whether start position has available link (next)
// Step 3. create new node with value of GCD
// Step 4. new node's link should be start position's available link
// Step 5. move start position to available link
// ... repeat until start position has no available link (no more next)


// "can divide" == "remain is 0"

// GCD: max value from divisors that can be divide both numbers
// smaller number itself can be gcd since it can divide bigger number


// GCD by its character
// Step 1. min value from either a or b
// Step 2. check whether both a and b can be divided by min value
// Step 3. if true, gcd is min value
// Step 4. if false, subtract 1 from min value and retry from step 2


// Euclidean algorithm
// for a and b, set remain as r for a % b (a>b),
// gcd of a and b is equal to gcd of b and r
// by this character, get r' by b%r,
// repeat steps of getting remain by r%r' until remain is 0
// at that point, r' is gcd of a and b


class Solution {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        else { return gcd(b, a%b) }
    }

    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        var insert = head
        while insert != nil {
            if let next = insert!.next {
                let newNode = ListNode(gcd(insert!.val, next.val))
                newNode.next = next
                insert!.next = newNode
                insert = next
            } else {
                break
            }
        }
        return head
    }
}
