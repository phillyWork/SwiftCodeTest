import Foundation

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

// check with left and right subtree's height
// get max height from left or right

// DFS

class Solution {

    func dfsInorderHeight(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        return max(dfsInorderHeight(node.left), dfsInorderHeight(node.right)) + 1
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        return dfsInorderHeight(root)
    }
}


// DFS style has stack overflow error possibility
// e.g.) one-side skewed tree

// BFS

// using queue to check

// remove first-in, add up depth, add up left and right subtree

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var queue: [(TreeNode, Int)] = [(root, 1)]
        var depth = 0

        while !queue.isEmpty {
            let (node, level) = queue.removeFirst()
            depth = max(depth, level)

            if let left = node.left {
                queue.append((left, level + 1))
            }
            if let right = node.right {
                queue.append((right, level + 1))
            }
        }
        return depth
    }
}
