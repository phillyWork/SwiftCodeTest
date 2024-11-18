import Foundation

// 반복되는 패턴 == index 기준값으로 나누기, 나머지 활용

// 여럿일 경우, 오름차순으로 정렬하라고 요구하지만 따로 sorted가 필요하지는 않다.
// 처음 결과값 세팅을 1번부터 n번 사람까지 미리 순서를 설정해두고 계산을 했기에, enumerated에서 filter로 걸러진 남은 element의 offset만 구하면 된다.

func solution(_ answers:[Int]) -> [Int] {
    
    let first = [1, 2, 3, 4, 5]
    let second = [2, 1, 2, 3, 2, 4, 2, 5]
    let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var result = [0, 0, 0]
    
    for i in 0..<answers.count {
        if answers[i] == first[i%5] {    // 답안 5개 패턴
            result[0] += 1
        }
        if answers[i] == second[i%8] {    // 답안 8개 패턴
            result[1] += 1
        }
        if answers[i] == third[i%10] {    // 답안 10개 패턴
            result[2] += 1
        }
    }
       
    let max = result.max()        // 가장 큰 값 찾기
    
    // 가장 큰 값과 동일한 값의 Index만 남기기
    return result.enumerated().filter { $0.element == max }.map { $0.offset + 1 }
}


// dictionary로 답안 패턴 및 정답 구조 미리 구성 (key, value)
// enumerated로 element 및 index 동시에 처리하기

func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted { $0.key < $1.key }.filter { $0.value == point.values.max() }.map { $0.key }
}
