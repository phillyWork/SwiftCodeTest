import Foundation

// transform each digit into letter array
// pick every element from each array by recursive dfs

class Solution {

    enum LetterToNum: Int {
        case two = 2
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine

        var letters: [String] {
            switch self {
                case .two: return ["a", "b", "c"]
                case .three: return ["d", "e", "f"]
                case .four: return ["g", "h", "i"]
                case .five: return ["j", "k", "l"]
                case .six: return ["m", "n", "o"]
                case .seven: return ["p", "q", "r", "s"]
                case .eight: return ["t", "u", "v"]
                case .nine: return ["w", "x", "y", "z"]
                default: return []
            }
        }
    }

    func backtrack(_ index: Int, _ current: String, _ digitArr: [[String]]) -> [String] {
        if index == digitArr.count {
            return [current]
        }
    
        var result: [String] = []
        for letter in digitArr[index] {
            result += backtrack(index + 1, current + letter, digitArr)
        }
    
        return result
    }

    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }

        let digitArr = digits.map { LetterToNum(rawValue: Int(String.init($0))!)!.letters }
        return backtrack(0, "", digitArr)
    }
}



// no recursive function

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        let dStrMap = ["2": "abc",
                       "3": "def",
                       "4": "ghi",
                       "5": "jkl",
                       "6": "mno",
                       "7": "pqrs",
                       "8": "tuv",
                       "9": "wxyz"]
        
        var res = [String]()
        
        // transform into each digit
        // e.g.) "234" --> ["2", "3", "4"]
        for d in digits.map({$0}) {

            guard let keys = dStrMap[String(d)] else { break }

            // if empty: set as letter array
            // e.g.) d: "2" --> res: ["a", "b", "c"]
            if res.isEmpty {
                keys.forEach { res.append(String($0)) }
                continue
            }
            
            // if res is not empty: move that to arr
            // arr: ["a", "b", "c"], res: []
            let arr = res.map { _ in res.removeFirst() }
            
            // in simple way
//            let arr = res
//            res.removeAll()
            
            // e.g.) keys: def
            for ch in keys {
                // add each letter from keys to each element in arr
                // e.g.) arr: ["a", "b", "c"]
                // add ["ad", "bd", "cd"] to res
                // add ["ae", "be", "ce"] to res
                // add ["af", "bf", "cf"] to res
                res += arr.map { $0 + String(ch) }
            }
            
            // res: ["ad", "bd", "cd", "ae", "be", "ce", "af", "bf", "cf"]
        }
        
        return res
    }
}
