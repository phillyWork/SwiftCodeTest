import Foundation

// 재귀함수 활용
// 팩토리얼 숫자 역할을 하는 숫자만 구하기

func solution(_ n:Int) -> Int {
    func fact(i: Int, n: Int) -> Int {
        if n/i == 0 {
            return i-1
        }
        return fact(i: i+1, n: n/i)
    }
    return fact(i: 1, n: n)
}

// 반복문 내에서 해결
// 팩토리얼 결과값이 n보다 커지기 전까지의 최대값만 구하기

func solution(_ n:Int) -> Int {
    var fact = 1
    var num = 1
    while fact <= n {
        num += 1
        fact *= num
    }
    return num - 1
}
