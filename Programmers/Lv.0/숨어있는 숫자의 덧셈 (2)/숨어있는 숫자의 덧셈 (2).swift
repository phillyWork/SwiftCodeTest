import Foundation

// 정수 형변환이 가능한 문자열 뽑아서 문자열을 만날 때마다 숫자로 저장해놓기

func solution(_ my_string:String) -> Int {
    var intInString = [String]()
    
    // 자릿수 고려없이 한번에 처리하기 위함
    // 미리 정수형으로 변환하면 이후 덧셈 계산 더 어려워짐
    
    // e.g.) a1b2와 ab12를 미리 정수형만 뽑으면 똑같이 ["1", "2"]
    // 실제 값은 1 + 2 vs. 12
    
    var temp = ""
    
    for str in my_string {
        if Int(String(str)) != nil {
            temp.append(str)
        } else {
            // 이전까지 기록한 정수형 문자열 저장하기
            // 기록한 것이 있어야 저장
            if !temp.isEmpty {
                intInString.append(temp)
                temp.removeAll()
            }
        }
    }
    
    // 마지막 문자열까지 계속해서 숫자만 나온 경우, else에 걸리지 않아 temp에만 남음
    // e.g.) a3g53421
    if !temp.isEmpty {
        intInString.append(temp)
    }
    
    return intInString.reduce(0) { $0 + Int($1)! }
}


// split
// parameter 중 whereSeparator 활용
// 조건에 부합하는 element들을 건너 뛰고 문자열을 나눠서 배열로 반환

// !$0.isNumber
// 숫자가 아닌 element들은 모두 건너뜀
// 조건에 부합하지 않는 숫자인 문자열들을 각 element로 갖는 배열 반환

func solution(_ my_string:String) -> Int {
    return my_string.split(whereSeparator: { !$0.isNumber }).reduce(0) { $0 + Int($1)! }
}
