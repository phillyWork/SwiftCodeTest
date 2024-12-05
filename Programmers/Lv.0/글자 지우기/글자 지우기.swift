import Foundation

// 각 글자를 문자열 타입으로 변환
// 해당 index 확인을 위해 enumerated 활용
// indices에 포함되지 않는 문자열 element만 남기기

func solution(_ my_string:String, _ indices:[Int]) -> String {
    return my_string.map { String.init($0) }.enumerated()
    .filter { !indices.contains($0.offset) }
    .map { $0.element }
    .joined()
}


// Array 대신 Set으로 만들어서 검색 더 최적화하기

func solution(_ my_string: String, _ indices: [Int]) -> String {
    let indicesSet = Set(indices)
    return my_string.enumerated()
        .filter { !indicesSet.contains($0.offset) }
        .map { String($0.element) }
        .joined()
}


// 각 글자를 문자열 타입으로 변환
// indices에 해당하는 index를 기반으로 빈 문자열 element로 대체하기
// 비어있는지 여부 판단하기

func solution(_ my_string:String, _ indices:[Int]) -> String {
    var my_string = my_string.map { String($0) }
    indices.forEach { my_string[$0] = "" }
    return my_string.filter { !$0.isEmpty }.map { String($0) }.joined()
}
