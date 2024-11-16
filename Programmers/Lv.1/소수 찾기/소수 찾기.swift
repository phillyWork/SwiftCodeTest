import Foundation

// n까지 모두 다 나눠볼 필요 없음
// 1과 자기 자신으로만 나뉜다는 말은 그 외의 다른 수로 나누었을 때 나머지가 0이 되어선 안된다.
// a = b * c 일 때, b와 c는 a를 나머지가 0이 되도록 하는 수이다.
// 나머지가 0이 된다는 뜻은 몫이 되는 수가 (1...N) 수열 안에 존재하므로 이후에 나머지가 0이 되는 수가 발견됨을 의미한다.
// 만약 b < c 라면, 우리는 b로 확인한 이후 c의 차례에 다시 나누어보지 않아도 된다는 것을 의미한다.
// 따라서, b == c 인 경우까지 고려하여 제곱근 값까지 확인하면 이후의 수들은 확인하지 않아도 된다.
// 다만 제곱근 값, 즉 (1...N)의 한가운데 값의 다음 숫자, Int(sqrt(n))+1 까지 확인할 필요가 있다.

func solution(_ n:Int) -> Int {
    var result = 0
    for i in 2...n {
        if checkPrime(i) {
            result += 1
        }
    }
    return result
}

func checkPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    else if n == 2 || n == 3 { return true }
    else {
        for i in 2...Int(sqrt(Double(n)))+1 {
            if n%i == 0 {
                return false
            }
        }
        return true
    }
}


// 에라토스테네스의 체
// 첫번째 방법으로 해결은 되지만 단순 구현이며 숫자가 더 커질 경우의 O(n^2)의 값이 기하급수적으로 더 커질 수 있는 문제가 존재한다.
// 소수를 구하는 고전 방법으로 에라토스테네스의 체를 활용한다.

// 1부터 n까지 모든 element가 0으로 초기화된 배열을 생성, 이후 소수를 제외한 나머지 배수들을 제거하는 행위를 해당 배열의 element값을 더하는 식으로 처리한다.
// 그렇게 처리하고 나면 element가 0일 때마다 소수 개수를 추가한다.

func solution(_ n:Int) -> Int {
    var prime = Array(repeating: 0, count: n+1)
    var cnt = 0

    for i in 2...n {
        if prime[i] == 0 {
            cnt += 1
            for j in stride(from: i, to: n+1, by: i) {
                prime[j] = 1
            }
        }
    }
    return cnt
}


// 배열 Index 활용하기
// 1부터 n이 i로 나눠진 정수 몫까지 j를 각각 곱하면서 나온 위치의 index를 모두 소수가 아닌 수로 낙인찍으며 소수 판별을 한다.

func solution(_ n:Int) -> Int {
    var notPrime = Array(repeating: false, count: n+1)
    var count = 0
    
    for i in 2...n {
        if (!notPrime[i]) {
            count += 1
        }
        for j in 1...(n/i) {
            notPrime[i*j] = true
        }
    }
    return count
}
