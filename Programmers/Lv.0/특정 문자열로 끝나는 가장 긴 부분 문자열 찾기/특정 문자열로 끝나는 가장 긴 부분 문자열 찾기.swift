import Foundation

// pat은 무조건 myString의 부분 문자열

// pat의 가장 마지막 문자열을 구해서 myString애서의 맨 마지막 위치 찾기
// 맨 처음부터 pat의 가장 마지막 문자열까지의 거리 구하기: distance

// 최종적으로 prefix로 해당 거리만큼의 부분 문자열 추출

func solution(_ myString:String, _ pat:String) -> String {
    let end = Character(String(pat.suffix(1)))
    
    guard let lastIndex = myString.lastIndex(of: end) else { return "" }
    
    let index = myString.distance(from: myString.startIndex, to: lastIndex)
    
    return String(myString.prefix(index+1))
}

// pat을 가장 마지막, suffix로 가질 때까지 dropLast하기

func solution(_ myString:String, _ pat:String) -> String {
    var str = myString

    while str.hasSuffix(pat) == false {
        str = String(str.dropLast())
    }
    return str
}
