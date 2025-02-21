import Foundation

// divide until n divide 3 is not 0
// if n == 1 : it's only divided by 3

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        
        guard n > 0 else { return false }
        
        var num = n
        
        while num % 3 == 0 {
            num /= 3
        }
        
        return num == 1
    }
}


// Follow up: Could you solve it without loops/recursion?

// largest power of 3 in 32-bit: 1162261467

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && 1162261467 % n == 0
    }
}
