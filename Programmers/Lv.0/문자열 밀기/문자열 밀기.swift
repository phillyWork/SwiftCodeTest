import Foundation

// 원본 문자열 개수만큼 밀어봐도 B와 동일하지 않다면 B가 될 수 없음

func solution(_ A:String, _ B:String) -> Int {
    
    var arrA = A.map { String.init($0) }
    var count = 0
    
    while count < A.count {
        if arrA.joined() == B {
            return count
        }
        let last = arrA.removeLast()
        arrA.insert(last, at: 0)
        count += 1
    }
    
    return -1
}


// A와 B 동일 비교 먼저해서 처리하고 for문으로 배열 길이만큼만 반복문 돌기

// func dropLast(_ k: Int = 1) -> [Self.Element]
// Returns a sequence containing all but the given number of final elements.
// 특정 개수의 마지막 element들 제외한 배열 반환, default로 1개만 제거

func solution(_ A: String, _ B: String) -> Int {
    if A == B { return 0 }
    
    var shifted = A
    for i in 1..<A.count {
        shifted = String(shifted.last!) + shifted.dropLast()
        if shifted == B { return i }
    }
    
    return -1
}
