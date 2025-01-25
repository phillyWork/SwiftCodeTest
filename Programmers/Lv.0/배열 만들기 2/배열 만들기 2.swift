import Foundation

// stride from...to: from 이상, to 미만

// func allSatisfy(_ predicate: (Self.Element) throws -> Bool) rethrows -> Bool
// Returns a Boolean value indicating whether every element of a sequence satisfies a given predicate

// 5와 0으로만 구성 체크하기

func solution(_ l:Int, _ r:Int) -> [Int] {
    let result = stride(from: l, to: r+1, by: 1).filter { String($0).allSatisfy { $0 == "5" || $0 == "0" } }
    return result.count == 0 ? [-1] : result
}

// 5와 0만으로 구성 < -- > 그 외의 것 포함하는 sequence가 비어있는지 체크하기

func solution(_ l:Int, _ r:Int) -> [Int] {
    let result = (l...r).filter { String($0).filter { $0 != "0" && $0 != "5" }.isEmpty }
    return result.isEmpty ? [-1] : result
}

// Set 활용해서 isSubset으로 5와 0으로만 구성되어있는지 확인하기

func solution(_ l:Int, _ r:Int) -> [Int] {
    let answer = (l...r).map { $0 }.filter { Set(String($0)).isSubset(of: ["0", "5"]) }
    return answer.isEmpty ? [-1] : answer
}
