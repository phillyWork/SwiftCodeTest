import Foundation

// goal: Binary Search Tree (BST) --> Balanced BST

// balanced: depth of 2 subtrees (left and right) of every node is same or differs only 1

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */




// first attempt
// 1. get left and right subtree's total depth
// 2. by traversing each node in left and right subtree, when there's nil node in left or right subtree, other side's node would be the root of balanced binary tree

// Error
// Can't get left and right subtree's total depth correctly
// Time Over: traversing BST multiple times in loop


// It's not about getting depth


// BST: left subtree is always smaller than middle, right subtree is always bigger than middle

// in-order traverse: left-middle-right
// recursively traverse whole nodes to get sorted array

// Balanced: every node should be evenly distributed into left and right, not skewed
// to be evenly distributed: middle node should be kept first

// create balanced BST from sorted array
// recursively set left and right of each subtree's root

class Solution {
    
    // by In-Order Traverse, return sorted array of BST's values
    // to get only values (exclude nil)
    func inOrderTraverse(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = []
                
        result += inOrderTraverse(root.left)
        result.append(root.val)
        result += inOrderTraverse(root.right)
        
        return result
    }
    
    // create Balanced BST from sorted array
    func sortedArrayToBST(_ array: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        
        let middleIndex = (left + right) / 2
        let root = TreeNode(array[middleIndex])
        
        root.left = sortedArrayToBST(array, left, middleIndex - 1)
        root.right = sortedArrayToBST(array, middleIndex + 1, right)
        
        return root
    }
    
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        let sortedValues = inOrderTraverse(root)
        return sortedArrayToBST(sortedValues, 0, sortedValues.count - 1)
    }
}
