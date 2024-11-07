import Foundation

// while 반복문

func solution(_ n:Int) -> [Int] {
    var num = n
    var result = [Int]()
    
    while num != 1 {
        result.append(num)
        num = num%2 == 0 ? num/2 : 3*num+1
    }
    
    result.append(num)
    return result
}

// Sequence 정의 활용
// n부터 시작하는 sequence를 생성, n 이후의 element들을 closure로 정의 가능

func solution(_ n:Int) -> [Int] {
    return sequence(first: n) { num in num == 1 ? nil : (num%2 == 0 ? num/2 : 3*num+1) }.map { $0 }
}
