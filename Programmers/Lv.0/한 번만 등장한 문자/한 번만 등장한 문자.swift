import Foundation

// 등장 횟수와 해당 문자를 연결할 dictionary 활용
// 사전 순으로 정렬이 필요하므로 sorted 필요

func solution(_ s:String) -> String {
    var dict: [String: Int] = [:]
    
    s.forEach {
        if dict[String($0)] != nil {
            dict[String($0)]! += 1
        } else {
            dict[String($0)] = 1
        }
    }

    return String(dict.reduce("") { $1.value == 1 ?  $0 + $1.key : $0 }.sorted())
}


// input에 들어온 문자열을 아예 Dictionary로 미리 만들기

// Array(s).map(String.init) : s의 각 문자를 String type의 element 가지는 array 만들기

// by: 새로 생성할 dict의 key값

// grouping 활용: 새로 생성할 dict의 value값 --> by에서 설정된 key로 구분되어서 그룹 설정

// e.g.) "abcabcadc"
// ["b": ["b", "b"], "a": ["a", "a", "a"], "c": ["c", "c", "c"], "d": ["d"]]

// 실제 string이 필요하므로 key값으로 변경 후, sorted로 정렬, 배열을 하나의 String 반환값을 만들기 위해 joined 활용

func solution(_ s: String) -> String {
    return Dictionary(grouping: Array(s).map(String.init), by: { $0 })
        .filter { $0.value.count <= 1 }
        .map { $0.key }
        .sorted()
        .joined()
}
