import Foundation

// 원리: 시계방향으로 이동: 오른쪽 --> 아래쪽 --> 왼쪽 --> 위쪽 --> 오른쪽 --> ... 반복
// 방향 전환 순간: 각 배열 맨 앞 혹은 맨 뒤, 혹은 이미 값이 있는 경우

func solution(_ n: Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var value = 1
    var xPos = 0
    var yPos = 0

    while value <= n*n {
        // 오른쪽 이동
        while yPos < n && result[xPos][yPos] == 0 {
            result[xPos][yPos] = value
            value += 1
            yPos += 1
        }
        // 행의 끝 혹은 이미 값이 있는 경우: 방향 전환용 시작 위치로 이동
        yPos -= 1
        xPos += 1

        // 아래쪽 이동
        while xPos < n && result[xPos][yPos] == 0 {
            result[xPos][yPos] = value
            value += 1
            xPos += 1
        }
        // 열의 끝 혹은 이미 값이 있는 경우: 방향 전환용 시작 위치로 이동
        xPos -= 1
        yPos -= 1

        // 왼쪽 이동
        while yPos >= 0 && result[xPos][yPos] == 0 {
            result[xPos][yPos] = value
            value += 1
            yPos -= 1
        }
        // 행의 맨 앞 혹은 이미 값이 있는 경우: 방향 전환용 시작 위치로 이동
        yPos += 1
        row -= 1

        // 위쪽 이동
        while xPos >= 0 && result[xPos][yPos] == 0 {
            result[xPos][yPos] = value
            value += 1
            xPos -= 1
        }
        // 열의 맨 앞 혹은 이미 값이 있는 경우: 방향 전환용 시작 위치로 이동
        xPos += 1
        yPos += 1
    }

    return result
}


// 방향 전환 및 위치값 연산 정돈되게 나타내기

func solution(_ n:Int) -> [[Int]] {
    // 우 → 하 → 좌 → 상 이동 기준 x, y의 값 변화 순서
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]

    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var xPos = 0, yPos = 0, direction = 0  // 초기 위치 및 방향 (오른쪽으로 시작)
    
    for num in 1...(n * n) {
        result[xPos][yPos] = num
        let nextX = xPos + dx[direction], nextY = yPos + dy[direction]
        
        // 범위를 벗어나거나 이미 값이 있는 경우 방향 변경
        if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n || result[nextX][nextY] != 0 {
            direction = (direction + 1) % 4  // 방향 전환
        }
        
        xPos += dx[direction]
        yPos += dy[direction]
    }
    
    return result
}


