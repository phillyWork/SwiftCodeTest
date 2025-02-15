import Foundation

// create next row with current row's values

class Solution {

    func createNextRow(_ row: [Int]) -> [Int] {
        guard row.count > 1 else { return [1, 1] }
            
        var result = [Int]()

        for i in 0...row.count {
            if i == 0 || i == row.count { result.append(1) }
            else { result.append(row[i-1] + row[i]) }
        }

        return result
    }

    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]

        for _ in 1..<numRows {
            let nextRow = createNextRow(result.last!)
            result.append(nextRow)
        }

        return result
    }
}


// by its definition, time complexity is O(n^2)
// should look at previous elements every time

// for space complexity: O(n) by working in one function

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = [[1]]

        for i in 1..<numRows {
            var row = [1] // add up first 1
            let prevRow = result[i - 1]

            for j in 1..<prevRow.count {
                row.append(prevRow[j - 1] + prevRow[j]) // add up 2 numbers from previous row
            }

            row.append(1) // add up last 1
            result.append(row)
        }

        return result
    }
}
