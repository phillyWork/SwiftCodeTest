import Foundation

// concatenation: twice nums

class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        result.append(contentsOf: nums)
        result.append(contentsOf: nums)
        return result
    }
}


// instead of adding contents twice, use for-loop once

// set size first with 2n

class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: 2 * nums.count)
        
        for i in 0..<n {
            result[i] = nums[i]
            result[i + nums.count] = nums[i]
        }
        
        return result
    }
}
