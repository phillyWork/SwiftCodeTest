import Foundation

// until num becomes 0, while loop code blocks works out
// whether it is even or odd number

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var totalStep = 0
        var checknum = num
        while checknum != 0 {
            if checknum%2 == 0 {
                checknum /= 2
            } else {
                checknum -= 1
            }
            totalStep += 1
        }
        return totalStep
    }
}

// more neat code

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var totalStep = 0
        var checknum = num
        while checknum != 0 {
            checknum = checknum % 2 == 0 ? checknum / 2 : checknum - 1
            totalStep += 1
        }
        return totalStep
    }
}



// goal: make num into 0
// use String(init:radix:) to convert Int to 2 bit String

// 2 bit: divide by 2 --> "removed"

// if bit is 0: it's even number --> divide
// if bit is 1: it's odd number --> subtract and divide

// e.g.) 14
// convert to 1110  / count: 0
// 1110 --> 111     / count: 1
// 111 --> 11       / count: 3
// 11 --> 1         / count: 5
// 1 --> 0          / count: 7
// final: count = 6

// logically: should be 6, needs no division but code will do 2 steps since 1 is odd number

// at last: -1 for when number becomes 0
// last operation to get 0 is already counted, needs no operation,
// but code will count extra if there's no adjustment

class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        String(num, radix: 2).reduce(0) { $1 == "1" ? $0 + 2 : $0 + 1 } - 1
    }
}
