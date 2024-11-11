import Foundation

// 단순 반복문

func solution(_ names:[String]) -> [String] {
    
    var result = [String]()
    
    for i in 0..<names.count {
        if i%5 == 0 {
            result.append(names[i])
        }
    }
    return result
}

// enumerated 활용, 배열 index로 구하기

func solution(_ names:[String]) -> [String] {
    return names.enumerated().filter { $0.offset % 5 == 0 }.map { $0.element }
}

// stride 활용
// index가 0부터 (names.count-1)까지 5개씩 간격을 두고 names 배열을 map으로 재구성

func solution(_ names: [String]) -> [String] {
    return stride(from: 0, to: names.count, by: 5).map { names[$0] }
}
