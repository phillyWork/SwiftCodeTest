import Foundation

// n을 a로 나눈 몫에 b를 곱한 개수가 새로 얻을 콜라 개수
// 기존 콜라 개수는 새로 얻을 콜라 개수에 기존 n에서 a로 나눈 나머지 개수를 더한 값
// 이 콜라 개수가 a개 미만일 때까지 계속해서 구하기

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var remainCoke = n
    var count = 0
    
    while remainCoke >= a {
        count += remainCoke / a * b
        remainCoke = (remainCoke / a * b) + (remainCoke % a)
    }
    
    return count
}

// 조건에 따라 무조건 a가 b보다 크다.

// 기존 콜라 개수 n이 b보다 작거나 같으면 a개를 줄 수 없으므로 교환을 할 수 없다. 따라서 0번 교환을 한다.
// a개를 주면 b개를 받는 행위는 a-b라고 할 수 있다.

// 교환하지 못할 때까지 반복하므로 마지막 교환때는 무조건 돌려받지 못한다.
// 따라서 (n-b)개 만큼은 무조건 교환을 한다.

// (n-b)/(a-b)는 전체 n개의 교환횟수라고 할 수 있다.
// 교환마다 b개를 받으므로 (n-b)/(a-b) * b를 하면 최종 교환 개수를 얻을 수 있다.

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    return (n > b ? n - b : 0) / (a - b) * b
}
