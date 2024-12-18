import Foundation

// 문제 순서 내역대로 처리

// 정규표현식 활용, 해당 문자열 이외는 제외하기

func solution(_ new_id:String) -> String {
    
    // ^ 뒤에 나오는 정규식에 반대되는 문자들
    let availableString = "[^0-9a-z._-]"
    
    var replacedString = new_id.lowercased().replacingOccurrences(of: availableString, with: "", options: .regularExpression)
    
    // .. -> .
    while replacedString.contains("..") {
        replacedString = replacedString.replacingOccurrences(of: "..", with: ".")
    }
    
    if let first = replacedString.first, String(first) == "." {
        replacedString.removeFirst()
    }
    
    if let last = replacedString.last, String(last) == "." {
        replacedString.removeLast()
    }
    
    if replacedString.length == 0 {
        replacedString.append("a")
    }
    
    if replacedString.length >= 16 {
        replacedString = replacedString.map { String.init($0) }[0...14].joined()
        
        if let last = replacedString.last, String(last) == "." {
            replacedString.removeLast()
        }
    }
        
    if replacedString.length <= 2 {
        while replacedString.length < 3 {
            if let last = replacedString.last {
                replacedString.append(String(last))
            }
        }
    }
    
    return replacedString
}



// 부분 개선

func solution(_ new_id:String) -> String {
    
    let availableString = "[^0-9a-z._-]"
    
    var replacedString = new_id.lowercased().replacingOccurrences(of: availableString, with: "", options: .regularExpression)
    
    while replacedString.contains("..") {
        replacedString = replacedString.replacingOccurrences(of: "..", with: ".")
    }
    
    // 개선 부분
    if replacedString.first == "." { replacedString.removeFirst() }
    if replacedString.last == "." { replacedString.removeLast() }
    if replacedString.isEmpty { result = "a" }
    
    if replacedString.count >= 16 {
        replacedString = String(replacedString.prefix(15))
        if replacedString.last == "." { replacedString.removeLast() }
    }
    
    while replacedString.count <= 2 {
        replacedString.append(replacedString.last ?? "a")
    }
    
    return replacedString
}
