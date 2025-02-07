import Foundation

// 중복 등장: 모두 세어줘야 하기 때문에 단순히 해당 부분을 대체하거나 제거하면 안됨
// e.g.) banana, ana
// if 제거 --> 1번만 등장한 것으로 count

// pat의 길이만큼 substring을 구해서 pat과 일치하는지 확인하기

func solution(_ myString: String, _ pat: String) -> Int {
    
    var count = 0
    
    let myChars = Array(myString)
    
    // pat.count 빼는 이유, 마지막 비교: 맨 마지막 element까지 포함해서 비교해야 하기 때문
    for i in 0...(myChars.count - pat.count) {
        let substring = myChars[i..<i+pat.count]
        if String(substring) == pat {
            count += 1
        }
    }
    
    return count
}


// where로 조건문 한번에 처리하기

func solution(_ myString:String, _ pat:String) -> Int {
    var s = Array(myString)
    var ans = 0

    for i in 0..<s.count-pat.count+1 where s[i..<i+pat.count].map{String($0)}.joined() == pat{
        ans += 1
    }
    return ans
}


// myString 따로 배열 만들지 않고 한번에 처리하기
// String에서는 Int type subscript가 적용되지 않으므로
// String Index 활용해야 하므로 startIndex 활용

func solution(_ myString: String, _ pat: String) -> Int {
    return (0...myString.count - pat.count)
        .map { myString[myString.index(myString.startIndex, offsetBy: $0)..<myString.index(myString.startIndex, offsetBy: $0 + pat.count)] }
        .filter { $0 == pat }.count
}
