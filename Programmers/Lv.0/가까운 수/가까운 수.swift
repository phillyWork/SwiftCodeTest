import Foundation

// abs 활용, 가장 작은 차이 나타난 값 찾아서 반환

// 숫자 차이 absMin의 초기값으로 100을 한 이유
// 극단적으로 array의 가장 작은 element가 1, n이 가장 큰 경우가 100 이므로 99를 넘을 수 없기에
// 숫자 차이인 absMin이 무조건 update 되도록 설정

func solution(_ array:[Int], _ n:Int) -> Int {
    
    var nearest = n;
    var absMin = 100;
    
    for num in array {
        if num == n {
            return n
        }
        
        if absMin > abs(n-num) {
            nearest = num
            absMin = abs(n-num)
        } else if absMin == abs(n-num) {
            if nearest > num {
                nearest = num
            }
        }
    }
    
    return nearest
}


// 문제점: absMin의 초기값 할당 시, 어떤 값을 주냐에 따라 문제가 해결되지 못하는 경우 발생

// 목적: 가장 최소 차이나는 값 찾기

// min(by:) 활용
// min { $0 < $1 } 이면 $0를 return

// abs($0-n)과 abs($1-n)을 비교, 더 작은 값을 반환
// 혹은 abs($0-n)과 abs($1-n)이 일치하면서 $0이 $1보다 작은 값을 반환

func solution(_ array: [Int], _ n: Int) -> Int {
    return array.min { (abs($0 - n) < abs($1 - n)) || ((abs($0 - n) == abs($1 - n)) && $0 < $1) }!
}


// tuple 비교를 활용
// (a, b) < (c, d)
// 1. a와 c를 비교
// 2. a == c라면 b와 d 비교

// abs($0-n)과 abs(1-n)을 먼저 비교
// 만약 동일하다면 $0과 $1을 비교해서 더 작은 값을 반환

func solution(_ array:[Int], _ n:Int) -> Int {
    return array.min(by: { (abs($0 - n), $0) < (abs($1 - n), $1) } )!
}
