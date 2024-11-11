import Foundation

// n이 0이 될 때까지 10으로 나눈 나머지를 더하고, n은 10으로 나눈 몫으로 update

func solution(_ n:Int) -> Int {
    var result = 0
    var num = n
    
    while num != 0 {
        result += num%10
        num /= 10
    }

    return result
}

// map, reduce 활용
// 1) n을 String으로 형변환
// 2) map을 활용해서 각 자리수를 Int 타입으로 가져옴
// 3) reduce 활용: 0부터 시작해서, 현재 결과물에 각 자리 수를 더해서 다음 결과물 가져옴

func solution(_ n:Int) -> Int {
    return String(n).map{ Int(String($0))! }.reduce(0,+)
}
