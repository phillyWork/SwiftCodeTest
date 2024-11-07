import Foundation

// 단순 반복문

func solution(_ s1:[String], _ s2:[String]) -> Int {
    var result = 0
    for s in s1 {
        if s2.contains(String(s)) {
            result += 1
        }
    }
    return result
}

// filter, map 활용
// s1 배열의 각 element가 s2에 포함되는지 체크해서 포함되는 element만 count하기

func solution(_ s1:[String], _ s2:[String]) -> Int {
    return s1.filter{ s2.contains($0) }.count
}

// map으로 s2에 포함되는 element를 포함하는 s1의 element를 count하기

func solution(_ s1: [String], _ s2: [String]) -> Int {
    return s1.map(s2.contains(_:)).filter { $0 }.count
}

// Set 활용, 포함 여부 따지기
// 순서 상관없이 중복 포함을 허용하지 않는다

func solution(_ s1:[String], _ s2:[String]) -> Int {
    return Set(s1).intersection(Set(s2)).count
}
