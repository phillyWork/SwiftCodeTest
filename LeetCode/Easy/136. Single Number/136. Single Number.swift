import Foundation

// for every num, check appearance with dictionary

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = Dictionary<Int, Int>()
        
        for num in nums {
            result[num] = (result[num] ?? 0) + 1
        }

        print(result)
        
        for (key, value) in result.filter { $0.value < 2 } {
            return key
        }

        return 0
    }
}


// improvement: use Dictionary<Int, Bool> to check appearance
// remove from dictionary when appeared twice

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = [Int: Bool]()

        for num in nums {
            if let _ = result[num] {
                result.removeValue(forKey: num)  // Remove if it already appeared
            } else {
                result[num] = true  // Insert if it's first time
            }
        }

        return result.keys.first!  // Return the only one element
    }
}


// improvement: use XOR
// XOR: 0 when two elements are same, 1 when two elements are different

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
