import Foundation

// by constraint, every element is either 0 or 1
// for every element, check only 1's index
// get absolute value of 1's index - eachIndex

class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        
        let availBoxArray = Array(boxes).enumerated().filter { Int(String($0.element))! != 0 }.map { $0.offset }

        return Array(boxes).enumerated().map { $0.offset }.map {
            var result = 0
            for index in availBoxArray {
                result += abs(index-$0)
            }
            return result
         }

    }
}


// improvement: check only left and right once for each
// Complexity: O(n)

class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let boxesArray = Array(boxes)
        var answer = [Int](repeating: 0, count: n)
        
        var count = 0
        var operations = 0
        
        // Left to right pass
        for i in 0..<boxes.count {
            answer[i] += operations
            if boxesArray[i] == "1" {
                count += 1
            }
            operations += count
        }
        
        count = 0
        operations = 0
        
        // Right to left pass
        for i in (0..<boxes.count).reversed() {
            answer[i] += operations
            if boxesArray[i] == "1" {
                count += 1
            }
            operations += count
        }
        
        return answer
    }
}
