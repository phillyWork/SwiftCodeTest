import Foundation

// replacingOccurrences 활용 시도

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    let toBeReplaced = my_string.map { String.init($0) }[s..<s+overwrite_string.count].joined()
    return my_string.replacingOccurrences(of: toBeReplaced, with: overwrite_string)
}

// 반례
// 입력값 〉 "aaaaaa", "bbb", 3
// 기댓값 〉 "aaabbb"
// 실제값 > "bbbbbb"


// String.Index로 구해서 구성, 합치기

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    let startIndex = my_string.startIndex
    let begin = my_string[..<my_string.index(startIndex, offsetBy: s)] // s 이전 부분
    let end = my_string[my_string.index(startIndex, offsetBy: s + overwrite_string.count)...] // s + overwrite_string.count 이후 부분
    return begin + overwrite_string + end
}

// 개선: Prefix, suffix 활용

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    return String(my_string.prefix(s)) + overwrite_string + String(my_string.suffix(my_string.count - overwrite_string.count - s))
}



// replaceSubrange 활용해서 직접 대체하기

func solution(_ myString: String, _ overwriteString: String, _ s: Int) -> String {
    var myString = Array(myString)
    myString.replaceSubrange(s...(overwriteString.count+s-1), with: Array(overwriteString))
    return String(myString)
}
