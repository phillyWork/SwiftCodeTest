import Foundation

// 단순 반복문

func solution(_ n:Int) -> [Int] {
    
    var result = [Int]()
    var index = 1
    
    while index <= n {
        result.append(index)
        index += 2
    }
    
    return result
}

// 범위에서 filter 활용
// 2로 나눈 나머지가 1인 경우만 구한다

func solution(_ n: Int) -> [Int] {
    return (1...n).filter { $0 % 2 == 1 }
}
