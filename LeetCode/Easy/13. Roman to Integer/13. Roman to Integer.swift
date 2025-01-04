import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        
        //I, X, C
        var checkMinus = [0, 0, 0]
        var result = 0
        for c in s {
            switch c {
                case "I":
                    result += 1
                    checkMinus[0] += 1
                case "V":
                    if checkMinus[0] != 0 {
                        result += 3
                        checkMinus[0] = 0
                    } else {
                        result += 5
                    }
                case "X":
                    if checkMinus[0] != 0 {
                        result += 8
                        checkMinus[0] = 0
                    } else {
                        result += 10
                        checkMinus[1] += 1
                    }
                case "L":
                    if checkMinus[1] != 0 {
                        result += 30
                        checkMinus[1] = 0
                    } else {
                        result += 50
                    }
                case "C":
                    if checkMinus[1] != 0 {
                        result += 80
                        checkMinus[1] = 0
                    } else {
                        result += 100
                        checkMinus[2] += 1
                    }
                case "D":
                    if checkMinus[2] != 0 {
                        result += 300
                        checkMinus[2] = 0
                    } else {
                        result += 500
                    }
                case "M":
                    if checkMinus[2] != 0 {
                        result += 800
                        checkMinus[2] = 0
                    } else {
                        result += 1000
                    }
                default: print("progressing")
            }
        }
        return result
    }
}

// improvement: make dictionary for each Roman character

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanValues: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        var result = 0
        var previousValue = 0
        
        for c in s {
            let currentValue = romanValues[c]!

            // if previous value is smaller than current value: delete twice (already added in previous)

            // e.g.) IX
            // I --> +1
            // X: I < X --> +10 -2
            // total: +1+10-2
            
            if currentValue > previousValue {
                result += currentValue - 2 * previousValue
            } else {
                result += currentValue
            }
            
            previousValue = currentValue
        }
        
        return result
    }
}
