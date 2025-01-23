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


// In-Order Traversal
// At a node: traverses as "Left SubTree - Node - Right SubTree"

// using inout to update traversal result

class Solution {

    func inOrder(_ tree: inout [TreeNode], _ node: TreeNode?) {
        guard let node = node else { return }

        inOrder(&tree, node.left)
        tree.append(node)
        inOrder(&tree, node.right)
    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var inOrderTree = [TreeNode]()

        inOrder(&inOrderTree, root)

        return inOrderTree.map { $0.val }
    }
}


// Follow up: Recursive solution is trivial, could you do it iteratively?

// Not using inout

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var inOrderTree = [TreeNode]()
        var stack = [TreeNode]()
        var current = root
        
        while current != nil || !stack.isEmpty {
            
            // Traverse Left SubTree
            while current != nil {
                stack.append(current!)
                current = current.left
            }
            
            // Visit current node
            
            // popLast: return optional type
            // removeLast: error when sequence is empty
            
            current = stack.popLast()
            if let current = current {
                inOrderTree.append(current)
            }
            
            // Traverse Right SubTree
            current = current.right
        }

        return inOrderTree.map { $0.val }
    }
}
