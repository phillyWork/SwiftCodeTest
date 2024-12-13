import Foundation

// String 활용, 나머지 값 구하기와 동일

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    return Array(code).enumerated().filter { $0.offset % q == r }.map { String($0.element) }.joined()
}

// 개선
// 굳이 String 자체를 Array로 만들 필요는 없음
// 어차피 enumerated()로 offset 활용

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    return code.enumerated().filter(\.offset % q == r).map(\.element).joined()
}


// 참고: KeyPath 활용
// Root type에서부터 구체적인 Value type으로의 key 경로 의미

// Root: String.enumerated()으로 반환된 EnumeratedSequence<String>
// Value: EnumeratedSequence의 프로퍼티인 offset, element

// 목적
// 1. 문자열 아닌 프로퍼티 이름으로 접근: runtime error (오타, 잘못된 입력) 방지
// 2. 좀 더 간결하게 작성 가능 (불필요한 프로퍼티 제거)
