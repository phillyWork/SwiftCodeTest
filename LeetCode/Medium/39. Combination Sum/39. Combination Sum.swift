import Foundation

// goal: find all unique cases
// unique ~ only one time

// DFS: recursively add unique cases from each candidate number
// BackTracking: remove cases already added before or exceeded target number

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        // current: current candidate array case
        // remain: remaining target number
        // index: index to start search
        func dfs(_ current: inout [Int], _ remain: Int, _ index: Int) {
            // remain: 0 ~ right case
            // remain < 0 ~ wrong case
            if remain == 0 {
                result.append(current)
                return
            } else if remain < 0 {
                return
            }
            
            
            for i in index..<candidates.count {
                current.append(candidates[i])
                // index doesn't change until checking whether it's right or wrong case
                dfs(&current, remain - candidates[i], i)
                // remove candidates[i] from current
                // if right case: added current to result, doesn't need to check again ~ remove current candidate number, check next index item
                // if wrong case: remove current candidate number, check next index item
                current.removeLast()
            }
        }
        
        var result = [[Int]]()
        var currentCombination = [Int]()
        
        dfs(&currentCombination, target, 0)
        return result
    }
}
