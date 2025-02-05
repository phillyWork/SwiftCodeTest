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

// check nodes with inOrderTraverse

// compare value with sum-up / count-of-subtree-nodes

class Solution {
    
    // class variable to check equal nodes
    private var result = 0

    func addUp(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return addUp(node.left) + node.val + addUp(node.right)
    }

    func countUp(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return countUp(node.left) + countUp(node.right) + 1
    }

    func inOrderTraverse(_ node: TreeNode?) {
        guard let node = node else { return }
        
        inOrderTraverse(node.left)      // visit left subtree
        
        if addUp(node) / countUp(node) == node.val {
            result += 1
        }

        inOrderTraverse(node.right)     // visit right subtree
    }

    func averageOfSubtree(_ root: TreeNode?) -> Int {
        result = 0      // initialization for this function
        inOrderTraverse(root)
        return result
    }

}


// instead of setting result variable as class member, use inout to update itself

// using postOrder traverse to deal with adding up sum-up and count-of-nodes at the same time

// return value: (sum-up, count-of-nodes)

class Solution {
    private func postorder(_ root: TreeNode?, _ result: inout Int) -> (Int, Int) {
        guard let root = root else { return (.zero, .zero) }

        let leftSubtree = postorder(root.left, &result)
        let rightSubtree = postorder(root.right, &result)

        let sum = leftSubtree.0 + rightSubtree.0 + root.val
        let count = leftSubtree.1 + rightSubtree.1 + 1

        if sum / count == root.val {
            result += 1
        }

        return (sum, count)
    }

    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var result = 0
        postorder(root, &result)
        return result
    }
}
