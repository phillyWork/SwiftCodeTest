import Foundation

// 나눗셈 덧셈
// 분모: 곱 구성
// 분자: 상대방 분모 곱 --> 합

// 분자와 분모 나눌 수 있을 만큼 나누기: 분자와 분모의 최대공약수로 나누기 == 더 이상 나눠지지 않을 때까지 나누기

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        } else {
            return gcd(b, a % b)
        }
    }
    
    var num = numer1 * denom2 + numer2 * denom1
    var denom = denom1 * denom2
    
    let division = gcd(num, denom)
    
    return [num/division, denom/division]
}
