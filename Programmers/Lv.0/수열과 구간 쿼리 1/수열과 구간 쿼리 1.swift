import Foundation

// 단순 해결: query의 0, 1번째 element 사이의 모든 element에 대해 arr[element]는 +1

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    
//    queries.forEach { query in
//        let (s, e) = (query[0], query[1])
//        (s...e).forEach { result[$0] += 1 }
//    }
    
    queries.forEach { ($0[0]...$0[1]).forEach { result[$0] += 1 } }
    
    return result
}


// 개선: 차분 배열 (Difference Array) 활용

// 차분 배열: 누적합 활용시 사용
// 배열의 연속적인 부분 업데이트 시 빠르게 수행 (O^n 방지 목적)

// 변화의 시작과 끝만 기록
// 차분 배열을 누적하여 각 위치에 최종 변화량만 계산하면 됨

// 하나의 변화: 시작 지점: +, 끝 지점+1: -
// 누적된 변화량 한번에 계산
// 1~4: +1
// 3~5: +1
// 3~4: +1

// 최종 누적량으로 더하기: 해당 지점에서 차분 배열의 값 + 현재까지의 누적합 sum 을 더한 값이 최종 누적량

func solution(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    // 차분 배열 (원래 배열의 각 위치에서의 변화 기록)
    var diff = [Int](repeating: 0, count: arr.count + 1)
    
    for query in queries {
        let s = query[0]
        let e = query[1]
        diff[s] += 1        // 시작 지점
        diff[e + 1] -= 1    // 끝 지점 + 1
    }
    
    var result = [Int](repeating: 0, count: arr.count)
    var sum = 0

    // 원본 배열 순회하며 차분 배열 누적합 더하기
    for i in 0..<arr.count {
        sum += diff[i]
        result[i] = arr[i] + sum
    }
    
    return result
}


// e.g.) 예제 문항

// arr: [0, 1, 2, 3, 4]
// queries: [[0, 1],[1, 2],[2, 3]]

// queries의 의미
// 0 ~ 1: +1
// 1 ~ 2: +1
// 2 ~ 3: +1

// 결과
// 0: +1
// 1: +2
// 2: +2
// 3: +1
// 4: +0


// diff: [0, 0, 0, 0, 0, 0]
// --> query1: [1, 0, -1, 0, 0, 0]
// --> query2: [1, 1, -1, -1, 0, 0]
// --> query3: [1, 1, 0, -1, -1, 0]

// diff와 이전 누적합을 활용해 현재 위치의 누적합 sum을 구하기

// sum: 0 --> 1
// result[0]: 0 + 1 = 1

// sum: 1 --> 2
// result[1]: 1 + 2 = 3

// sum: 2 --> 2
// result[2]: 2 + 2 = 4

// sum: 2 --> 1
// result[3]: 3 + 1 = 4

// sum: 1 --> 0
// result[4]: 4 + 0 = 4

// result: [1, 3, 4, 4, 4]

