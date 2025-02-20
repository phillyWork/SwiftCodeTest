import Foundation

// Int size can be very big
// add each digit with considering carry
// reverse original to start from 0th digit

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var carry = 1
        var answer = digits.reversed().map {
                let result = $0 + carry
                carry = result / 10
                return result % 10
            }

        if carry > 0 {
            answer.append(1)
        }

        return answer.reversed()
    }
}



// not using reversed method
// start 0th digit as setting index of digits.count - 1

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        
        while i >= 0 {
            
            // because this is only adding 1, only consider where would be the position carry appears
            // less than 9: no need to consider carry
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            }
            
            digits[i] = 0
            i -= 1
        }
        
        // code flows to here only when carry appears in (n-1)th digit
        // other cases: already return in while-loop
        digits.insert(1, at: 0)

        return digits
    }
}
