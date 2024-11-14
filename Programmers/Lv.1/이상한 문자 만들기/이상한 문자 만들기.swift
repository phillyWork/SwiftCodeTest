import Foundation

// 단순 해결: 문자열 전체 한바퀴 반복문
// 문자열 내 각 문자의 index를 판단해서 해당 index가 짝수이면 대문자로, 홀수이면 소문자로 변환해서 결과값에 추가한다.

func solution(_ s:String) -> String {
    var result = ""
    var startIdx = 0
    for spell in s {
        if startIdx % 2 == 0 {
            result.append(String(spell).uppercased())
        } else {
            result.append(String(spell).lowercased())
        }
        startIdx += 1
        if spell == " " {
            startIdx = 0
        }
    }
    return result
}

// components, enumerated, map 활용
// 각 단어로 분리 후, enumerated를 활용해 offset을 쉽게 파악, 각 offset의 element에 변화주기

func solution(_ s:String) -> String {

    let transformed = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    
    // 예시의 경우: transformed = [["T", "r", "Y"], ["H", "e", "L", "l", "O"], ["W", "o", "R", "l", "D"]]
    // 각 배열 element 내 문자들을 하나의 단어로 결합, 그 후 각 단어 사이 빈 공백을 포함해서 문자열로 만들기
    
    return transformed.map { $0.joined() }.joined(separator: " ")
}
