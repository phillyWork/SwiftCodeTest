import Foundation

// split: x 기준 잘라내기
// map: SubString을 다시 String으로 타입 변환 필요
// sorted: 사전순 정렬

func solution(_ myString:String) -> [String] {
    return myString.split(separator: "x").map { String.init($0) }.sorted()
}

// filter: 빈칸 제거하기

func solution(_ myString: String) -> [String] {
    return myString.split(separator: "x").map(String.init).filter { !$0.isEmpty }.sorted()
}
