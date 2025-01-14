import Foundation

// goal: rotate 90 degrees clockwise
// modify 2d matrix directly

// n x n matrix

// transpose & reverse: directly modify matrix

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        
        // transpose
        for i in 0..<matrix.count {
            // j: starts with i
            // transpose only right side corner so that both sides are transposed only once
            for j in i..<matrix.count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        // reverse
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
        
    }
}



// rotate 90 degrees anti-clockwise
// reverse & transpose

// combined rotate function

class Solution {
    
    enum Position {
        case left
        case right
    }
    
    func transpose(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in i..<matrix.count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
    func reverse(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
        
        // not using reverse method
//        for i in 0..<matrix.count {
//            for j in 0..<(matrix.count / 2) {
//                let tmp = matrix[i][j]
//                matrix[i][j] = matrix[i][matrix.count - 1 - j]
//                matrix[i][matrix.count - 1 - j] = tmp
//            }
//        }
        
    }
    
    func rotate(_ matrix: inout [[Int]], _ position: Position) {
        switch position {
        case .left:
            transpose(&matrix)
            reverse(&matrix)
        case .right:
            reverse(&matrix)
            transpose(&matrix)
        }
    }
    
}


// n times rotate clockwise
// 0(=360), 90, 180, 270

// consider n % 4

class Solution {
    
    func rotate(_ matrix: inout [[Int]], _ n: Int) {
        let times = n % 4
        for _ in 0..<times {
            for i in 0..<matrix.count {
                for j in i..<matrix.count {
                    let temp = matrix[i][j]
                    matrix[i][j] = matrix[j][i]
                    matrix[j][i] = temp
                }
            }
            
            for i in 0..<matrix.count {
                matrix[i].reverse()
            }
        }
    }
}


