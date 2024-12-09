import Foundation

// 2진수 --> 10진수로 변환 --> 덧셈 후 다시 2진수로 변환

func solution(_ bin1:String, _ bin2:String) -> String {
    return String(Int(bin1, radix: 2)! + Int(bin2, radix: 2)!, radix: 2)
}


// 진수 변환 없이 직접 자리마다 덧셈 처리하기

func solution(_ bin1: String, _ bin2: String) -> String {
    let bin1Array = Array(bin1)
    let bin2Array = Array(bin2)
    var result = ""
    var carry = 0                   // 덧셈으로 자리 올림할 수
    
    // 맨 뒤쪽 index에서 시작: 맨 뒷자리에서 덧셈 시작
    var i = bin1Array.count - 1
    var j = bin2Array.count - 1
    
    // carry > 0인 이유: 가장 맨 앞자리에서 carry만 1로 남은 경우 따져야 하기 때문
    while i >= 0 || j >= 0 || carry > 0 {
        let bit1 = i >= 0 ? Int(String(bin1Array[i]))! : 0
        let bit2 = j >= 0 ? Int(String(bin2Array[j]))! : 0
        
        let sum = bit1 + bit2 + carry
        result += String(sum % 2)
        carry = sum / 2             // 1 + 1 = 10 --> 1: carry / 0: result
        
        i -= 1
        j -= 1
    }
    
    return result
}
