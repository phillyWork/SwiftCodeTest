import Foundation

// n까지의 숫자 목록 중 소수 찾아서 소인수분해 구하기

func getPrime(_ n: Int) -> [Int] {

    var num = Array(repeating: 0, count: n+1)
    var result = [Int]()

    for i in 2...n {
        if num[i] == 0 {
            result.append(i)
            for j in stride(from: i, to: n+1, by: i) {
                num[j] = 1
            }
        }
    }
    
    return result
}

func solution(_ n:Int) -> [Int] {
    
    let primeList = getPrime(n)
    var result = [Int]()
    
    for prime in primeList {
        if n%prime == 0 {
            result.append(prime)
        }
    }
    
    return result
}



// 소수를 다 찾을 필요 없이, root n까지 중 나눗셈 나머지가 0인 수들을 구해서, 중복 항 제거하기로 처리

func solution(_ n: Int) -> [Int] {
    var num = n
    var result = [Int]()
    var divisor = 2
    
    while divisor * divisor <= num {
        if num % divisor == 0 {
            result.append(divisor)
            while num % divisor == 0 {      // divisor로 나눌 수 있을만큼 계속 나누기
                num /= divisor
            }
        }
        
        divisor += 1
    }
    
    // num이 divisor^2보다 작아짐: root n까지 도착
    // 1보다 큰 경우: 해당 소수로 나눠질 수 있음
    
    // e.g.) 5746
    // 5746 --> 2873 (2)
    // 2873 --> 221 (13) --> 17 (13 * 13)
    // 14^2 > 17 --> 17 포함
    
    if num > 1 {
        result.append(num)
    }
    
    return result
}
