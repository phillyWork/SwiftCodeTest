import Foundation

// String에서 특정 문자열을 변환해주는 replacingOccurences() 메서드를 활용하면 간단하게 해결할 수 있다.
// 즉, 0~9에 해당하는 text들을 해당 정수로 변환하면 된다.

func solution(_ s:String) -> Int {
    var result = s
    let text = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    for i in 0..<text.count {
        result = result.replacingOccurrences(of: text[i], with: String(i))
    }
    
    return Int(result)!
}


// 오류 풀이 과정

// String 타입의 input이 들어오므로,
// 1. Array로 치환
// 2. 각 index의 element가 숫자이면 Int로 변환, 아닐 경우, text를 Int로 변환할 케이스를 구분
// 3. 각 text만큼의 길이만큼 index를 넘어가도록 처리

// 실행 결과
// signal: illegal instruction (core dumped)
// 테스트 결과 (~˘▾˘)~: 4개 중 1개 성공
// while문을 돌면서 오버플로우로 에러 발생

func solution(_ s:String) -> Int {
    var result = 0
    var i = 0
    var array = Array(s)
    while i < array.count {
        result *= 10
        if let num = Int(String(array[i])) {
            result += num
            i += 1
        } else {
            switch array[i] {
                case "z":
                    i += 4
                case "o":
                    result += 1
                    i += 3
                case "e":
                    result += 8
                    i += 5
                case "n":
                    result += 9
                    i += 4
                case "t":
                    if array[i+1] == "w" {
                        result += 2
                        i += 3
                    } else {
                        result += 3
                        i += 5
                    }
                case "f":
                    if array[i+1] == "o" {
                        result += 4
                    } else {
                        result += 5
                    }
                    i += 4
                default:
                    break
            }
        }
    }
    
    return result
}
