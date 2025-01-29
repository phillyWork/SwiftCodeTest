import Foundation

// a, b, c를 각각 빈칸으로 변경
// 빈칸을 기준으로 각각의 부분 문자열을 element로 만들기 위해 split 활용
// components: 빈칸도 element로 만들기에 활용하지 않음

func solution(_ myStr:String) -> [String] {
    let result = myStr
    .replacingOccurrences(of: "a", with: " ")
    .replacingOccurrences(of: "b", with: " ")
    .replacingOccurrences(of: "c", with: " ")
    .split(separator: " ")
    
    return result.isEmpty ? ["EMPTY"] : result.map { String.init($0) }
}


// 한번에 처리: a, b, c 일 경우, split 적용

func solution(_ myStr:String) -> [String] {
    return myStr.split { $0 == "a" || $0 == "b" || $0 == "c" }.map { String($0) }
}
