import Foundation

// split으로 빈 문자열 제거
// +, - 확인 후, 숫자 등장할 때마다 계산 적용

func solution(_ my_string:String) -> Int {
    var isAdd = true
    return my_string.split(separator: " ").reduce(0) { sum, current in
        if let num = Int(current) {
            return isAdd ? sum + num : sum - num
        } else {
            isAdd = current == "+" ? true : false
            return sum
        }
    }
}


// 고차함수 활용

// replacingOccurrences(of:with:)
// 빈칸 포함 -를 음수로 나타내기 위해 변경
// +는 제거: reduce에서 덧셈만 처리하기 위함

// trimmingCharacters(in:)
// 입력된 값을 문자열 앞뒤에 제거하기

func solution(_ myString: String) -> Int {
    return myString.replacingOccurrences(of: "- ", with: "-")
        .replacingOccurrences(of: "+", with: "")
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .split(separator: " ")
        .map { Int($0)! }
        .reduce(0, +)
}
