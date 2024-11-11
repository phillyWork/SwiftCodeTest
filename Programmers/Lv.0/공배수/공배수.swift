import Foundation

// 단순 공배수 나머지 계산

func solution(_ number:Int, _ n:Int, _ m:Int) -> Int {
    return number%n == 0 && number%m == 0 ? 1 : 0
}

// 최소 공배수 구하기: 나머지 계산을 한번만 하기 위한 목적

// 최소공배수(lcm)를 구하기 위해선 먼저 최대공약수(gcd)를 구해야 한다.
// a * b = gcd * lcm

// 최대공약수는 유클리드의 호제법을 활용해 구한다.
// 두 자연수 A, B(A ≥ B)에 대하여 A ÷ B = p⋅⋅⋅⋅⋅r(p!=0)에서
// A = Bp + r (0 ≤ r 〈 B) 이다. (나눗셈의 정리)
// A와 B의 최대공약수는 Bp+r과 B의 최대공약수와 같다.
// 여기서 Bp는 B의 배수이고, r는 B의 배수가 아니므로 (∵ 0 ≤ r 〈 B)
// A와 B의 최대공약수는 B와 r의 최대공약수와 같다.
// ∴ G(A,B) = G(B,r)

// A와 B의 최대공약수는 A를 B로 나눈 나머지가 r일 때 B와 r의 최대공약수와 같다.
// 재귀 함수 형태로 마지막 나머지가 0일 때까지 계속해서 구한다.

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ number:Int, _ n:Int, _ m:Int) -> Int {
    return number%lcm(n, m) == 0 ? 1 : 0
}

// isMultiple 활용

func solution(_ number:Int, _ n:Int, _ m:Int) -> Int {
    return number.isMultiple(of: n) && number.isMultiple(of: m) ? 1 : 0
}
