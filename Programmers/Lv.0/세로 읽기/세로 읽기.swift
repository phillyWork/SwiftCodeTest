import Foundation

// m: 4, c: 2
    
// 0  1  2  3
// 4  5  6  7
// 8  9  10 11
// 12 13 14 15
// 16 17 18 19
// 20 21 22
    
// 1:   0 * 4 + 1
// 5:   1 * 4 + 1
// 9:   2 * 4 + 1
// 13:  3 * 4 + 1
// 17:  4 * 4 + 1
// 21:  5 * 4 + 1

// 23 / 4 = 5, 23 % 4 = 3
    
// my_string.count / m : 몇 줄 나타낼 지 --> 몇 번 반복해서 확인할 지
// my_string.count % m : 풀 개수 이외에 나머지 개수가 c보다 큰 지 여부 따져서 한 번 더 확인할 지 결정


// 오류 과정: 반복문 돌림 --> core dump 오류 발생: 특히 반복 횟수 많아질 수록

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    
    let count = my_string.count % m >= (c-1) ? my_string.count/m + 1 : my_string.count/m
    
    var result = ""
    
    for i in 0..<count {
        result.append(Array(my_string)[i * m + (c-1)])
    }
    
    return result
}


// 반복문 직접 돌 필요 없이 index만 비교해서 따지기
// 결국 나머지 값이 C-1인 index만 뽑기

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    return myString.enumerated().filter { $0.offset % m == c - 1 }.map { String($0.element) }.joined()
}


// stride 활용
// 0번째인 C-1부터 최종 my_string.count까지 m 단위로 index 뽑기
// m * n + (c-1)

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    return stride(from: c - 1, to: my_string.count, by: m).map { String(Array(my_string)[$0]) }.joined()
}
