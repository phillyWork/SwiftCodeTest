import Foundation

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let head = Int(readLine()!)! - 1 // index 처리

var graph = Array(repeating: Array(repeating: 100, count: ve[0]), count: ve[0])

var result = Array(repeating: 100, count: ve[0])

for _ in 0..<ve[1] {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[uvw[0]-1][uvw[1]-1] = uvw[2]
}

for goalIndex in 0..<ve[0] {
    if goalIndex == head {
        result[goalIndex] = 0
        continue
    }
    
    // e.g. 1 --> 3 가는법
    // direct 1 --> 3
    // indirect 1 --> 2 --> 3
    
    // 2 --> 3 최소값을 알아서 1 --> 2의 가중치 + (2 --> 3 최소값) vs. 1 --> 3 가중치 비교하기
    
    // 1 --> 3 최소값 알기위해 2 --> 3 최소값 알아야 함
    
    // 부분 분리할 필요 있음
}

result.forEach { $0 > 10 ? print("INF") : print($0) }

