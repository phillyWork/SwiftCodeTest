import Foundation

// "최대한 많은 부서의 물품을 구매해주기"
// 요구 금액이 낮은 부서부터 사주면 최대한 많은 부서를 사줄 수 있다.


// Array의 sorted() 메서드를 이용, 오름차순으로 정렬된 배열을 활용한다.
// 배열을 활용해서 budget을 초과할 때까지 부서 개수를 추가한다.

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0
    var result = 0
    var sortD = d.sorted()
    for i in 0..<d.count {
        if sum + sortD[i] > budget {
            break
        }
        sum += sortD[i]
        result += 1
    }
    return result
}


// sorted() 배열을 변수로 따로 만들지 않고, sorted() 결과물에 filter 메서드를 적용하여 조건을 충족한 element만 보유한 배열을 받도록 한다.
// 이 배열의 element수를 count 속성을 활용해서 부서 개수를 얻을 수 있다.

func solution(_ d:[Int], _ budget:Int) -> Int {
    var currentBudget = budget

    return d.sorted().filter {
        currnetBudget -= $0
        return currentBudget >= 0
    }.count
}
