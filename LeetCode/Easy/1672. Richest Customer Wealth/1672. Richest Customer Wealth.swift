import Foundation

class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var array: [Int] = []
        for i in 0...accounts.count-1 {
            var result = 0
            for j in 0...accounts[i].count-1 {
                result += accounts[i][j]
            }
            array.append(result)
        }
        
        if let maxResult = array.max() {
            return maxResult
        } else {
            return 0
        }
        
    }
}


// improvement
// using reduce: add up each customer's wealth
// then pick max from customers' wealth

class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        return accounts.map { $0.reduce(0, +) }.max() ?? 0
    }
}
