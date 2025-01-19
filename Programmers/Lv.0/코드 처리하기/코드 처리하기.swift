import Foundation

// mode 정보, index 홀짝 여부로 결정하기

func solution(_ code:String) -> String {
    var result = ""
    var isModeZero = true
    
    let codeArr = code.map { String.init($0) }
    
    for i in 0..<code.count {
        if codeArr[i] == "1" {
            isModeZero.toggle()
            continue
        }
        
        if isModeZero {
            if i%2 == 0 {
                result.append(codeArr[i])
            }
        } else {
            if i%2 != 0 {
                result.append(codeArr[i])
            }
        }
    }
    
    return result.isEmpty ? "EMPTY" : result
}


// code 자체에서 reduce 활용, 빈 문자열에서 조건 충족하는 경우만 추가하기

// mode가 1일 때 홀수, 0일 때 짝수 한번에 활용하기

func solution(_ code: String) -> String {
    
    let result = code.enumerated().reduce(into: ("", 0)) { acc, val in
        let (index, char) = val

        if char == "1" {
            // toggle 활용
            acc.1 = 1 - acc.1
        } else if (acc.1 == index % 2) {
            acc.0 += String(char)
        }
    }
    
    return result.0.isEmpty ? "EMPTY" : result.0
}
