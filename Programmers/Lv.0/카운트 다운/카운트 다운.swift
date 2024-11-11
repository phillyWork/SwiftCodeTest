import Foundation

// stride 활용

func solution(_ start:Int, _ end:Int) -> [Int] {
    return stride(from: start, through: end, by: -1).map { $0 }
}

// (end...start)로 구성

// (start...end)는 에러
// start와 end가 동일하거나 start가 end보다 더 클 수 있으므로, sequence 구성에서 오류 발생
// Closed Range Operator
// The closed range operator (a...b) defines a range that runs from a to b,
// and includes the values a and b. The value of a must not be greater than b.

func solution1(_ start:Int, _ end:Int) -> [Int] {
    return (end...start).reversed()
}

func solution2(_ start:Int, _ end:Int) -> [Int] {
    return Array(end...start).sorted(by: >)
}
