import Foundation

// setup dictionary of index : character
// return string by index order

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var dict: [Int: String] = [:]
        var result = ""

        for (str, index) in zip(s, indices) {
            dict[index] = String(str)
        }

        for i in 0..<s.count {
            result.append(dict[i]!)
        }

        return result
    }
}

// setup array which has same length of s
// replace each character by its index in indices

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var res = Array<Character>(repeating: "a", count: indices.count)
        for i in 0 ..< indices.count {
            res[indices[i]] = Array(s)[i]
        }
        return String(res)
    }
}
