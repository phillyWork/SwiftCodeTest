import Foundation

// XOR operation: ^

// start with nums[0], which is same value as start
// should remove index 0 element for reduce method

class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        var nums = Array(repeating: 0, count: n)
        
        for i in 1..<n {
            nums[i] = start + 2 * i
        }

        nums.remove(at: 0)

        return nums.reduce(start) { (result, current) in
            return result^current
        }
    }
}


// starts reduce with 0

// 0 XOR 1 == 1
// 0 XOR 0 == 0

// 0 XOR n --> return n itself

class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        return (0..<n).map({ start + $0 * 2 }).reduce(0, ^)
    }
}
