import Foundation

// write s in order as it was
// add up last line after for-loop

class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {

        var result = [1, 0]
        var oneLineLimit = 0

        let dict: [String: Int] = [
            "a": widths[0],
            "b": widths[1],
            "c": widths[2],
            "d": widths[3],
            "e": widths[4],
            "f": widths[5],
            "g": widths[6],
            "h": widths[7],
            "i": widths[8],
            "j": widths[9],
            "k": widths[10],
            "l": widths[11],
            "m": widths[12],
            "n": widths[13],
            "o": widths[14],
            "p": widths[15],
            "q": widths[16],
            "r": widths[17],
            "s": widths[18],
            "t": widths[19],
            "u": widths[20],
            "v": widths[21],
            "w": widths[22],
            "x": widths[23],
            "y": widths[24],
            "z": widths[25]
        ]

        let stringArr = Array(s).map { dict[String($0)]! }

        for size in stringArr {
            if oneLineLimit + size > 100 {
                result[0] += 1
                oneLineLimit = size
            } else {
                oneLineLimit += size
            }
        }

        result[1] = oneLineLimit

        return result
    }
}


// using ascii value of each letter
// a -> widths[0]
// a's ascii value: 97

// set variable with lines and last line width instead of just one

class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var lines = 1
        var width = 0
        
        for char in s {
            let charWidth = widths[Int(char.asciiValue! - 97)]
            if width + charWidth > 100 {
                lines += 1
                width = charWidth
            } else {
                width += charWidth
            }
        }
        
        return [lines, width]
    }
}
