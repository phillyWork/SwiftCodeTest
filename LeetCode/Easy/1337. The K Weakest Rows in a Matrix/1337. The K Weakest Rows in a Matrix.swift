import Foundation

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var soldiers = [Int]()
        for row in mat {
            var count = 0
            for person in row {
                if person == 1 {
                    count += 1
                }
            }
            soldiers.append(count)
        }
        
        var loss: [Int: Int] = [:]
        for i in 0..<soldiers.count {
            loss[i] = 0
        }
         
        for i in 0..<soldiers.count {
            for j in i+1..<soldiers.count {
                if soldiers[i] > soldiers[j] {
                    loss[j]! += 1
                } else {
                    loss[i]! += 1
                }
            }
        }
        
        let sortedDict = loss.sorted { (first, second) in
                   if first.value == second.value {
                       return first.key > second.key
                   }
            return first.value > second.value
        }
        
        var result = [Int]()
        for i in 0..<k {
            result.append(sortedDict[i].key)
        }
        
        return result
    }
}

// improvement: 

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        // Calculate the number of soldiers in each row with the row index
        let soldiersWithIndex = mat.enumerated().map { (index, row) in
            (index, row.reduce(0, +)) // Calculate the sum of 1's in the row
        }
        
        // Sort based on the number of soldiers, and then by index
        let sortedRows = soldiersWithIndex.sorted {
            $0.1 < $1.1 || ($0.1 == $1.1 && $0.0 < $1.0)
        }
        
        // Extract the indices of the k weakest rows
        return sortedRows.prefix(k).map { $0.0 }
    }
}
