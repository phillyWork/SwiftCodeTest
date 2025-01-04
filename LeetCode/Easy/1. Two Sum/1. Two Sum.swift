import Foundation

// Brute Force Search
// iterating through each element of the array and checking if there is another element in the array that can be added to it to get the target value

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        
        return []
    }
}


// Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?

// Using Dictionary/HashTable

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hashTable: [Int:Int] = [:]
        for i in 0..<nums.count {
            hashTable[nums[i]] = i
        }
        
        for i in 0..<nums.count {
            var complement = target - nums[i]
            var index = hashTable[complement]
            
            if index != nil && index != i {
                return [index!, i]
            }
        }
        
        return []
    }
}

// improvement
// loops through the array using the enumerated() method to get both the index and value of each element in the array

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, value) in nums.enumerated() {
            if let addent = dict[value] {
                return [addent, index]
            } else {
                dict[target - value] = index
            }
        }
        
        return []
    }
}

// using pointer
// two pointers left and right are initialized at the beginning and end of the sorted array respectively.
// The pointers are then moved inward from both ends towards the middle of the array while checking whether the sum of the values at these pointers is equal to the target value.

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.sorted()
        var left = 0
        var right = nums.count - 1

        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            if sum == target {
                if let index1 = nums.firstIndex(of: sortedNums[left]), let index2 = nums.lastIndex(of: sortedNums[right]) {
                    return [index1, index2]
                }
            } else if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }

        return []
    }
}
