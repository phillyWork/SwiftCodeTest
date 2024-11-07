import Foundation

// n까지 반복문으로 나머지를 체크하여 추가

func solution(_ n: Int) -> Int {
    var result = 0
    
    for i in 1...n {
        if n%i == 0 {
            result += 1
        }
    }
    
    return result
 }

// filter를 활용해서 한번에 구하기

func solution(_ n: Int) -> Int {
    return (1...n).filter { n % $0 == 0 }.count
}
