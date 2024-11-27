import Foundation

// 각 숫자마다 나눗셈 횟수를 구한 뒤, reduce로 최종합 구하기

func solution(_ num_list:[Int]) -> Int {
    return num_list.map { num in
        var count = 0
        var n = num
        while n != 1 {
            if n%2 == 0 {
                n /= 2
                count += 1
            } else {
                n -= 1
                n /= 2
                count += 1
            }
        }
        return count
    }.reduce(0, +)
}

// 정리된 코드
// map과 reduce를 한번에 처리하기
// 결국 나눗셈 홀수 짝수 모두 실행 --> 홀짝 구분 및 처리 코드는 삼항 연산자로 한번에 나타내기

func solution(_ num_list: [Int]) -> Int {
    return num_list.reduce(0) { sum, num in
        var count = 0
        var n = num
        while n > 1 {
            count += 1
            n = (n % 2 == 0) ? (n / 2) : ((n - 1) / 2)
        }
        return sum + count
    }
}


// dfs 활용

// 모든 수: 1이면 연산 종료
// 과정에서 홀짝일 때에 따른 중간 작업 적용

// 나눗셈 횟수도 매개변수로 전달할 경우
func solution(_ num_list:[Int]) -> Int {
    func dfs(_ num: Int, _ count: Int) -> Int {
        if num == 1 { return count }
        return dfs(num / 2, count + 1)  // 나눗셈 연산 처리, 덧셈 추가 (정수 나눗셈: 내림 처리)
    }
    
    return num_list.reduce(0) { $0 + dfs($1, 0) }
}


// 순수 dfs 정의에 더 가까운 정의
func solution(_ num_list: [Int]) -> Int {
    func dfs(_ num: Int) -> Int {
        if num == 1 { return 0 } // 1이면 연산 종료
        let next = (num % 2 == 0) ? (num / 2) : ((num - 1) / 2) // 홀짝 따른 다음 처리 숫자 계산
        return 1 + dfs(next) // 나눗셈 연산 1회 추가 후 재귀 호출
    }
    
    // num_list의 각 원소에 대해 DFS 수행
    return num_list.reduce(0) { total, num in
        total + dfs(num)
    }
}




