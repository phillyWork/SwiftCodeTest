import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var jewelDict: [Character : Int] = [:]
        var result = 0

        for c in jewels {
            jewelDict[c] = 0
        }

        for c in stones {
            let doesContain = jewelDict.contains { $0.key == c }
            if doesContain {
                jewelDict[c]! += 1
            }
        }

        for element in jewelDict.keys {
            result += jewelDict[element]!
        }

        return result
    }
}


// improvement: doesn't need to create extra array

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        return stones.filter { jewels.contains($0) }.count
    }
}
