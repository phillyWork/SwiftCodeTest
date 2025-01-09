import Foundation

// perfect binary tree: if there is node, it should contain both left and right child node
// consider BFS (Breadth First Search)

// perfrom level-order traversal, keep track of current level

// collect nodes at each level, reverse values in odd levels before assigning them back

class Solution {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        // queue for level-order traversal
        // start with root
        var queue: [TreeNode] = [root]
        var level = 0

        // BFS
        while !queue.isEmpty {
            // current level's nodes count
            let levelSize = queue.count
            // save current level's nodes
            var currentLevelNodes: [TreeNode] = []

            // collect current level's node values in queue
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                currentLevelNodes.append(node)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            // at odd: reverse and reassign
            if level % 2 == 1 {
                // Reverse values at the current level
                // Convert reversed collection to Array to use subscript
                let reversedValues = Array(currentLevelNodes.map { $0.val }.reversed())
                
                // reassign reversed values to nodes
                for (i, node) in currentLevelNodes.enumerated() {
                    node.val = reversedValues[i]
                }
            }

            level += 1
        }

        return root
    }
}


// perform DFS instead of BFS
// swap values at each node right at that moment --> doesn't need extra space to save original order

// e.g.)
// 0
// 1 2
// 3 4 5 6
// 7 8 9 10 11 12 13 14

// 0
// 2 1
// 3 4 5 6
// 14 13 12 11 10 9 8 7

// swap
// left's left and right's right
// left's right and right's left

class Solution {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        reverseOddLevelsHelper(root.left, root.right, 1)
        return root
    }

    private func reverseOddLevelsHelper(_ left: TreeNode?, _ right: TreeNode?, _ level: Int) {
        guard let left = left, let right = right else { return }

        // If the current level is odd, swap the values
        if level % 2 == 1 {
            let temp = left.val
            left.val = right.val
            right.val = temp
        }

        // Recursive calls for the next level
        reverseOddLevelsHelper(left.left, right.right, level + 1)
        reverseOddLevelsHelper(left.right, right.left, level + 1)
    }
}
