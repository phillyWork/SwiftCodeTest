import Foundation

// remove all elements that are equal to val
// map, filter functions return a new sequence, not affecting original data
// assign new return value to its original

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}


// consider inout, which can affect original data
// instead of using filter function, modify original data itself

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[k] = nums[i]
                k += 1
            }
        }
        return k
    }
}
