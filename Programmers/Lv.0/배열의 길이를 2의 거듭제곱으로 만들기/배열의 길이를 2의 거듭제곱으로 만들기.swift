import Foundation

// 처음 시도: 2로 계속 나누어서 나눈 횟수로 처리하기
// 문제점: 2의 제곱수이든 아니든 무조건 몫이 1로 가면서 구분이 되지 않음

// 해결: 곱셈으로 비교하기
// 다음 2의 제곱을 찾기 위함이므로 곱해가며 크기 비교하기가 더 직관적

func nextTwoPowers(_ originalSize: Int) -> Int {
    
    var power = 1
    
    while power < originalSize {
        power *= 2
    }
     
    return power
}

func solution(_ arr:[Int]) -> [Int] {
    
    guard arr.count > 2 else { return arr }
    
    var result = arr
    
    let appendZero = Array(repeating: 0, count: nextTwoPowers(arr.count) - arr.count)
    
    result.append(contentsOf: appendZero)
        
    return result
}


// 곱셈 대신 시프트 연산 활용
// <<= : 왼쪽으로 이동, bit 연산 --> 2배 증가

// append 대신 + 연산자 활용

func solution(_ arr:[Int]) -> [Int] {
    var i = 1
    while i < arr.count { i <<= 1 }
    return arr + Array(repeating: 0, count: abs(arr.count - i))
}
