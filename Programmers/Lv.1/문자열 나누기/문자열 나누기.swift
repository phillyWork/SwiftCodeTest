import Foundation

// 문자열 분해 & 반복 --> 재귀적으로 해결

import Foundation

func solution(_ s:String) -> Int {

    func recursiveRead(_ current: String) -> Int {
        guard !current.isEmpty else { return 0 }
        
        var count = (0, 0)
        var first = ""
        var passToRecur = ""
        
        for char in current {
            if count.0 == 0 {
                first = String(char)
                count.0 += 1
                continue
            }
    
            if first == String(char) {
                count.0 += 1
            } else {
                count.1 += 1
            }
            
            if count.0 == count.1 {
                passToRecur = String(current.suffix(current.count - (count.0 + count.1)))
                break
            }
        }
        
        // 마지막 문자열도 분리된 문자열 개수이므로 1 반환
        return passToRecur.isEmpty ? 1 : recursiveRead(passToRecur) + 1
    }
    
    return recursiveRead(s)
}


// 재귀 없이 개수 세기

func solution(_ s:String) -> Int {
    var answer = 0
    var x: Character? = nil
    var xCount = 0

    for i in s {
        // 첫번째 문자 설정
        if x == nil {
            x = i
            xCount = 1
            answer += 1
            continue
        }

        // 첫번째 문자와 동일한지 여부 체크
        xCount += x == i ? 1 : -1

        // x의 개수 == x 외의 개수 --> x 개수가 0개인 것과 동일한 맥락
        if xCount == 0 {
            x = nil
        }
    }

    return answer
}
