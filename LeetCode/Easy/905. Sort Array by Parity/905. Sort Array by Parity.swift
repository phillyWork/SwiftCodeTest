import Foundation

// check when to insert even numbers

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var evenIndex = 0
        
        for num in nums {
            if num % 2 == 0 {
                result.insert(num, at: evenIndex)
                evenIndex += 1
            } else {
                result.append(num)
            }
        }
        
        return result
    }
}


// use filter to set even array and odd array

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        return nums.filter { $0 % 2 == 0 } + nums.filter { $0 % 2 != 0 }
    }
}


// set with partition
// start from left and right

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            // left is odd, right is even --> swap
            if nums[left] % 2 > nums[right] % 2 {
                nums.swapAt(left, right)
            }
            if nums[left] % 2 == 0 { left += 1 }
            if nums[right] % 2 != 0 { right -= 1 }
        }
        
        return nums
    }
}
