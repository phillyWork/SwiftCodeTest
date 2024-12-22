import Foundation

// 30!        2.6525286e+32
// Int.max    9223372036854775807

// Int type factorial 계산은 타입 최대 수를 넘어가게 됨

// Double type으로 변환, 더 많은 수를 커버하도록 처리
// balls와 share가 같은 경우 처리에 대한 코드가 factorial 함수에 없기에 guard로 미리 제거
// 결국 정수형 결과물이 필요하므로 Int 타입으로 형변환 필요

func solution(_ balls:Int, _ share:Int) -> Int {

    func factorial(_ n: Int) -> Double {
        return Double((1...n).reduce(1.0) { Double($0) * Double($1) })
    }
    
    guard balls != share else { return 1 }
    
    return Int(round(factorial(balls) / factorial(share) / factorial(balls-share)))
}


// 참고: Decimal을 활용해서 풀이도 가능




// nCr = nPr / r! = n! / (n-r)!r!

func solution(_ balls:Int, _ share:Int) -> Int {
    
    // n!/(n-r)! 구하기
    var result = (balls - share + 1...balls)
        .map { Double($0) }
        .reduce(1.0, *)

    // r! 나누기
    (1...share)
        .map { result /= Double($0) }

    return Int(result)
}
