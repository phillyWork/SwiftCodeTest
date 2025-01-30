import Foundation

// 범위 벗어나는지 여부 판단하기
// Set으로 중복 제거

func solution(_ board:[[Int]]) -> Int {
    
    var result = Set<[Int]>()
    
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] == 1 {
                
                result.insert([i, j])
                
                if i+1 < board.count {
                    result.insert([i+1, j])
                    if j-1 >= 0 {
                        result.insert([i+1, j-1])
                    }
                    if j+1 < board.count {
                        result.insert([i+1, j+1])
                    }
                }
                
                if i-1 >= 0 {
                    result.insert([i-1, j])
                    if j-1 >= 0 {
                        result.insert([i-1, j-1])
                    }
                    if j+1 < board.count {
                        result.insert([i-1, j+1])
                    }
                }
                
                if j+1 < board.count {
                    result.insert([i, j+1])
                }
                
                if j-1 >= 0 {
                    result.insert([i, j-1])
                }
                
            }
        }
    }
        
    return board.count * board.count - result.count
}


// 개선: 굳이 배열을 Set의 element로 받지 않기
// 위치값: n * row + col 계산값 (편의를 위해 row, col로 나눌뿐)

// 8방향 연산을 직접 하지말고 directions를 만들어 활용하기

func solution(_ board: [[Int]]) -> Int {
    let n = board.count
    var dangerZones = Set<Int>()
    
    // 8방향 체크용
    let directions = [
        (-1, -1), (-1, 0), (-1, 1),
        (0, -1), (0, 0), (0, 1),
        (1, -1), (1, 0), (1, 1)
    ]
    
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == 1 {
                for (dx, dy) in directions {
                    let nx = i + dx
                    let ny = j + dy
                    if nx >= 0, nx < n, ny >= 0, ny < n {
                        // e.g.) [3, 2]
                        // [2, 1] --> 2 * 5 + 1 = 11th index
                        dangerZones.insert(nx * n + ny)
                    }
                }
            }
        }
    }
    
    return n * n - dangerZones.count
}
