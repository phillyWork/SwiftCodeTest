import Foundation

// 1. t에서 p 자리수만큼 숫자들을 임시 생성, 이를 위해 각 시작점 위치 역할을 위한 정수 배열 생성
// 2. String 타입이므로 prefix로 마지막 지점을 먼저 지정, suffix는 p의 자리수를 적용해 동일한 자리수를 가지도록 함
// 3. Int type으로 변환, p보다 작거나 같으면 1, 크다면 0으로 값 할당 by map 함수
// 4. reduce 함수로 각 배열의 element 더해서 결과값 도출

// 예상 문제점: map 함수 와중에 prefix, suffix 적용으로 O(mn), 최악의 경우, O(n^2)가 예측됨

func solution(_ t:String, _ p:String) -> Int {
    return Array(0...t.count-p.count).map { Int(t.prefix(p.count+$0).suffix(p.count))! <= Int(p)! ? 1 : 0 }.reduce(0, +)
}

// String Index를 직접 구해서 해결하기
// String 타입은 직접적으로 Int 타입을 통한 subscript를 활용해 해당 element를 찾을 수 없으므로, String.Index를 구해서 활용

func solution(_ t:String, _ p:String) -> Int {
    //1. String.Index(utf16Offset:in:) 활용
    return (0..<t.count - p.count + 1).map { Int(t[String.Index(utf16Offset: $0, in: t)..<String.Index(utf16Offset: $0 + p.count, in: t)]) ?? 0 }.filter { Int(p)! >= $0 }.count
    
    //2. index(_:offsetBy:) 활용
    return (0..<t.count - p.count + 1).map { Int(t[t.index(t.startIndex, offsetBy: $0)..<t.index(t.startIndex, offsetBy: $0 + p.count)])! }.filter { Int(p)! >= $0 }.count
}
