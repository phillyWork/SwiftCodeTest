import Foundation

// set current number as max
// compare with each element

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

// Improvement
// O(n^2) --> O(nlogn)

class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {

        var count = Array(repeating: 0, count: 101) // range of nums[i]: 0~100 --> array size: 101
        var result = [Int](repeating: 0, count: nums.count)
        
        // count nums
        for num in nums {
            count[num] += 1
        }
        
        // check accumulated sum, add up which is smaller than current num
        for i in 1..<101 {
            count[i] += count[i - 1]
        }
        
        for i in 0..<nums.count {
            result[i] = nums[i] == 0 ? 0 : count[nums[i] - 1]
        }
        
        return result
    }
}
