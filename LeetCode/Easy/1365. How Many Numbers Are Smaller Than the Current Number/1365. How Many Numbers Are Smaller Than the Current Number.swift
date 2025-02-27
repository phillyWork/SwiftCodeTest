import Foundation

// 

class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        
        var result = [Int]()

        for i in 0..<nums.count {
            var maxValue = nums[i]
            var count = 0

            for j in 0..<nums.count {
                if j == i { continue }
                if nums[j] < maxValue { count += 1 }
            }

            result.append(count)
        }

        return result
    }
}
