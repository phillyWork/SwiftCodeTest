import Foundation

// "l"이나 "r"이 없다면 빈 리스트를 return합니다

// l 혹은 r이 없다면 무조건 빈 배열 반환 의미 아님
// l 또는 r이 무조건 존재하지만 실제로 반환할 element가 없다면 빈 배열 반환하라는 의미

// 처음 등장하는 것이 l 또는 r일때 배열 반환하기

func solution(_ str_list:[String]) -> [String] {
    for (index, str) in str_list.enumerated() {
        if str == "l" {
            return str_list.prefix(index).map { String.init($0) }
        } else if str == "r" {
            return str_list.suffix(str_list.count - index - 1).map { String.init($0) }
        }
    }
    return []
}

// String.init 대신 Array() 활용 [String]으로 구성하기

func solution(_ strList: [String]) -> [String] {
    
    if !strList.contains("r") && !strList.contains("l") {
        return []
    }
    
    // l 존재, r 여부에 따른 l의 index가 더 빠른 경우
    if strList.contains("l") && (!strList.contains("r") || strList.firstIndex(of: "l")! < strList.firstIndex(of: "r")!) {
        return Array(strList[..<strList.firstIndex(of: "l")!])
    }
    
    // r 존재, l 여부에 따른 r의 index가 더 빠른 경우
    if strList.contains("r") && (!strList.contains("l") || strList.firstIndex(of: "r")! < strList.firstIndex(of: "l")!) {
        return Array(strList[strList.firstIndex(of: "r")! + 1..<strList.count])
    }
    
    return []
}
