import Foundation

// 빈칸 아닌 element만 갖도록 배열 재구성: split
// 각 element가 Z인지 여부 판단: map
// 정수형으로 변환된 값을 더하기: reduce

func solution(_ s:String) -> Int {
    var previous = 0
    return s.split(separator: " ").map { char in
        if char == "Z" {
            return -Int(previous)
        } else {
            previous = Int(char)!
            return previous
        }
    }.reduce(0, +)
}


// 이전 정수 기억할 변수 없이 배열로 한번에 저장하기
// Z인 경우: 직전 저장한 값 다시 제거하기

func solution(_ s: String) -> Int {
    var stack = [Int]()

    for w in s.components(separatedBy: [" "]) {
        if w == "Z" {
            stack.popLast()                 // 직전 저장한 값 다시 제거 (+a-a == 0)
        } else {
            stack.append(Int(w)!)
        }
    }
    return stack.reduce(0, +)               // 저장된 값들 합 구하기
}
