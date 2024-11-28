import Foundation

// check whether index can be divided by 3 or 5 or both

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var answer: [String] = [ ]
        for i in 1...n {
            let div3 = i%3 == 0
            let div5 = i%5 == 0
            if div3 && div5 {
                answer.append("FizzBuzz")
            } else if div3 {
                answer.append("Fizz")
            } else if div5 {
                answer.append("Buzz")
            } else {
                answer.append("\(i)")
            }
        }
        return answer
    }
}

// more neat: use switch with remaining case check

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var output: [String] = []
        for num in 1...n {
            switch (num%3, num%5) {
            case (0, 0): output.append("FizzBuzz")
            case (0, _): output.append("Fizz")
            case (_, 0): output.append("Buzz")
            default: output.append(String(num))
            }
        }
        return output
    }
}


// if num can be divided by 3 or 5 or both, num can be made of 3 or 5 or both by multiplication
// use isMultiple(of:) to check
// map for each index with range of 1 to n

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        (1...n).map { $0.isMultiple(of: 15) ? "FizzBuzz" : $0.isMultiple(of: 3) ? "Fizz" : $0.isMultiple(of: 5) ? "Buzz" : "\($0)" }
    }
}
