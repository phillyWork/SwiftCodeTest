import Foundation

// Swift에서의 String: Int type Index 활용 불가
// String.Index 타입 활용 필요

// s와 e에 해당하는 각각의 String.Index 값을 구한 뒤, 반전된 부분 문자열을 원본에 대체하기
// replaceSubrange(with:) 활용
// subRange 영역 및 어떤 sequence로 대체할 것인지 parameter로 전달하기

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    var str = my_string
    let startIndex = my_string.index(my_string.startIndex, offsetBy: s)
    let endIndex = my_string.index(my_string.startIndex, offsetBy: e)
    str.replaceSubrange(startIndex...endIndex, with: my_string[startIndex...endIndex].reversed())
    return str
}

// String type Array로 변환, Int type Index 활용해서 replaceSubrange 활용

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    return Array(my_string)
        .replaceSubrange(s...e, with: Array(my_string)[s...e].reversed())
        .joined()
}


// 중간 대체할 부분 구하는 것 동일, prefix와 suffix 활용
// prefix(maxLength:) : 0 ~ s-1 의 길이 s까지의 부분 문자열
// suffix(from:) : e ~ sequence 마지막 까지의 부분 문자열

func solution(_ myString: String, _ s: Int, _ e: Int) -> String {
    return myString.prefix(s)
    + String(myString[myString.index(myString.startIndex, offsetBy: s)...myString.index(myString.startIndex, offsetBy: e)].reversed())
    + myString.suffix(from: myString.index(myString.startIndex, offsetBy: e + 1))
}


// s와 e 사이의 문자 직접 교환하기

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    var chars = Array(my_string)    // my_string.map { String.init($0) }
    var left = s
    var right = e
    while left < right {
        // 요소 교환
        let temp = chars[left]
        chars[left] = chars[right]
        chars[right] = temp
        // 인덱스 이동
        left += 1
        right -= 1
    }
    // 배열을 문자열로 변환하여 반환
    return String(chars)
    
}


// s와 e 사이의 중간 기준 서로 교체: 반복문 중간까지만 확인하면 됨
// swapAt 활용

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    var arrStr = my_string.map { String($0) }
    for i in 0...(e - s) / 2 {
        arrStr.swapAt(s + i, e - i)
    }
    return arrStr.joined()
}

