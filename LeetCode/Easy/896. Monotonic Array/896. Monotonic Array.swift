import Foundation

// check either increasing or decreasing with each variable

class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        
        var isDecreasing = true
        var isIncreasing = true

        for i in 1..<nums.count {
            isIncreasing = isIncreasing && nums[i-1] <= nums[i]
            isDecreasing = isDecreasing && nums[i-1] >= nums[i]
        }
        
        return isIncreasing || isDecreasing
    }
}
