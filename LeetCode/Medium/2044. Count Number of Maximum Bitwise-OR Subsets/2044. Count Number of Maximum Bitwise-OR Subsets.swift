import Foundation

class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {

        var maxBit = 0
        var result = 0
        
        for num in nums {
            maxBit |= num
        }

        // Iterate over all subsets using bit masking
        // all subsets: 1...2^n - 1
        for mask in 1..<(1 << nums.count) {
            var currentOr = 0
            
            // check each bit in mask
            for i in 0..<nums.count {
                // 1 << i : ith bit is 1
                // check mask's ith bit is 1
                if (mask & (1 << i)) != 0 {
                    // if 1, add up that 1 to OR operation
                    currentOr |= nums[i]
                }
            }
            
            if currentOr == maxBit {
                result += 1
            }
            
        }
        
        return result
    }

}



// create all possible combinations

// combinations(ofCount:)
// Returns a collection of combinations of this collection’s elements, with each combination having the specified number of elements.

// might be bad for big input data

class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        nums
        .combinations(ofCount: 1...)
        .map { $0.reduce(into: 0) { $0 |= $1 } }
        // key: OR operation result
        // value: result's appearance count
        .reduce(into: [:]) { $0[$1, default: 0] += 1 }
        .max { $0.key < $1.key }?.value ?? 0
    }
}
