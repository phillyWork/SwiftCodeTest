import Foundation

// n까지의 덧셈 과정을 기록하기
// 3의 배수 아니면서 3 포함하지 않을때만 포함하기

func solution(_ n:Int) -> Int {
    var arr = [Int]()
    var num = 1
    
    while arr.count < n {
        if num % 3 != 0 && !num.description.contains("3") {
            arr.append(num)
        }
        num += 1
    }
    
    return arr[n-1]
}


// 배열 대신 n에 대해서만 체크하기
// 3의 배수거나 3 포함하는 경우에만 +1로 계산해나가기

func solution(_ n:Int) -> Int {
    var answer = 0

    for i in 1...n {
        answer += 1

        while answer % 3 == 0 || String(answer).contains("3") {
            answer += 1
        }
    }

    return answer
}
