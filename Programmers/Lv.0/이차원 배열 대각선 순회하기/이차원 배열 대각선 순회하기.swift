import Foundation

// 단순 해결: 중첩 for문

func solution(_ board:[[Int]], _ k:Int) -> Int {
    
    var result = 0
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if i + j <= k {
                result += board[i][j]
            }
        }
    }
    
    return result
}



// indices 활용

// k보다 작거나 같은 i 중 j가 k-i보다 작거나 같으면 board[i][j] 반환, 값 더하기
// 각 i에서 구한 값 다 더해 최종값 구하기

func solution(_ board: [[Int]], _ k: Int) -> Int {
    return board.indices.filter { i in i <= k }
        .map { i in
            board[i].indices.filter { j in j <= k - i }
                .map { j in board[i][j] }
                .reduce(0, +)
        }.reduce(0, +)
}


// enumerated 활용 더 간단하게

// row.element.prefix(k-row.offset + 1)
// 만족해야 하는 조건: i+j <= k
// 각 row (i) 배열에 대하여 j가 가질 수 있는 값: 최대 k-i+1 (prefix: index가 아닌 element 개수로 작동하기 때문)
// prefix: 0부터 j의 최대값 k-i+1까지의 값들의 배열

func solution(_ board: [[Int]], _ k: Int) -> Int {
    return board.enumerated().reduce(0) { sum, row in
        sum + row.element.prefix(k - row.offset + 1).reduce(0, +)
    }
}
