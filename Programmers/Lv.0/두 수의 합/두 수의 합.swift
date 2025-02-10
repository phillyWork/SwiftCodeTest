import Foundation

// a와 b의 자릿수 --> Int 타입 변경: 사이즈 초과
// String으로 직접 비교해서 더하기 처리

// 자릿수 차이: 더 긴 길이를 기준으로 더하기 처리

// reverse로 앞에서부터 더해나가기 --> 마지막에 다시 reverse 처리하기

func solution(_ a:String, _ b:String) -> String {
    var result = [String]()
    var carry = 0
    
    let reversedA = Array(a.reversed())
    let reversedB = Array(b.reversed())
    
    let maxLength = max(reversedA.count, reversedB.count)

    for i in 0..<maxLength {
        let intA = i < reversedA.count ? Int(String(reversedA[i]))! : 0
        let intB = i < reversedB.count ? Int(String(reversedB[i]))! : 0

        let sum = intA + intB + carry
        carry = sum / 10
        result.append(String(sum % 10))
    }

    // 마지막 캐리 처리
    if carry > 0 {
        result.append(String(carry))
    }
    
    return result.reversed().joined()
}

// reverse 처리없이 array 기준 맨 뒤에서부터 덧셈처리하기

func solution(_ a: String, _ b: String) -> String {
    let aChars = Array(a)
    let bChars = Array(b)
    
    var i = aChars.count - 1
    var j = bChars.count - 1
    var carry = 0
    var result = ""
    
    while i >= 0 || j >= 0 || carry > 0 {
        let digitA = i >= 0 ? Int(String(aChars[i]))! : 0
        let digitB = j >= 0 ? Int(String(bChars[j]))! : 0
        
        let sum = digitA + digitB + carry
        carry = sum / 10
        result.append(String(sum % 10))
        
        i -= 1
        j -= 1
    }
    
    return String(result.reversed())
}


// 자릿수 비교 없이 한번에 처리하기

func solution(_ a: String, _ b: String) -> String {
    var result = ""
    var carry = 0
    
    var i = a.count - 1, j = b.count - 1
    
    let aArr = Array(a).map { Int(String($0))! }, bArr = Array(b).map { Int(String($0))! }

    while i >= 0 || j >= 0 || carry > 0 {
        var sum = carry

        if i >= 0 {
            sum += aArr[i]
            i -= 1
        }
        if j >= 0 {
            sum += bArr[j]
            j -= 1
        }
        
        result = "\(sum % 10)" + result
        
        carry = sum / 10
    }
    
    return result
}
