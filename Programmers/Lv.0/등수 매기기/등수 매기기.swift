import Foundation

// 평균 점수 활용 --> 나눗셈 없이 덧셈 합으로 활용해도 무방
// 해당 문제: 2개만 존재 --> 만약 n개의 점수 합 ~ reduce 활용해서 합 구한뒤, count로 element 개수로 나누기

func solution(_ score:[[Int]]) -> [Int] {
    let sortedAvg = score.map { $0[0] + $0[1] }.sorted(by: >)
    return score.map { sortedAvg.firstIndex(of: $0[0] + $0[1])! + 1 }
}


// enumerated 활용 index를 구해서 활용하기
// (rank, 해당 rank의 index) 활용하기

func solution(_ score:[[Int]]) -> [Int] {
    let sortedIndices = score.map { $0.reduce(0, +) }.enumerated().sorted(by: { $0.element > $1.element }).map { $0.offset }

    var ranks = Array(repeating: 0, count: score.count)
    
    for (rank, index) in sortedIndices.enumerated() {
        ranks[index] = rank + 1
    }
    
    return ranks
}
