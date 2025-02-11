import Foundation

// original array: x1...xn, y1...yn
// split into two arrays which are size of n
// add up each element

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = [Int]()
        
        let xNums = Array(nums.prefix(n))
        let yNums = Array(nums.suffix(n))

        for i in 0..<n {
            result.append(xNums[i])
            result.append(yNums[i])
        }

        return result
    }
}



// not creating unnecessary arrays
// y1 = x1 + n
// y2 = x2 + n

class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var res = [Int]()
        
        for i in 0..<n {
            res.append(nums[i])
            res.append(nums[i + n])
        }
        
        return res
    }
}
