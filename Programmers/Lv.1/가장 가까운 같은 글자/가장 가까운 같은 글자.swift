import Foundation

// Dictionary 활용, 해당 문자가 나타난 마지막 위치값 기억하기

// 각 문자와 해당 값을 -1로 초기화한 Dictionary를 정의
// 문자열의 각 문자를 체크하면서 해당 값이 -1이면 처음 등장한 경우의 처리를,
// 다른 값이라면 가장 최근에 등장한 index를 가지고 있을 것이므로 현재 위치에서 최근 등장한 index 와의 차이를 계산.

import Foundation

func solution(_ s:String) -> [Int] {
    var position = ["a": -1, "b": -1, "c": -1, "d": -1, "e": -1, "f": -1, "g": -1, "h": -1, "i": -1, "j": -1, "k": -1, "l": -1, "m": -1, "n": -1, "o": -1, "p": -1, "q": -1, "r": -1, "s": -1, "t": -1, "u": -1, "v": -1, "w": -1, "x": -1, "y": -1, "z": -1]
    var result = [Int]()
    
    for (offset, element) in Array(s).enumerated() {
        if (position[String(element)] == -1) {
            result.append(-1)
        } else {
            result.append(offset - position[String(element)]!)
        }
        position[String(element)] = offset
    }
        
    return result
}


// 빈 Dictionary로 시작해도 무방
// 등장한 적 없다면 Dictionary에 존재하지 않을 것이므로 존재 여부를 먼저 체크,
// 존재하면 가장 최근에 등장한 위치값을 활용해서 계산.

func solution(_ s: String) -> [Int] {
    var position: [Character: Int] = [:]
    var result: [Int] = []

    s.enumerated().forEach { (offset, element) in
        if let previousOffset = position[element] {
            result += [offset - previousOffset]
            position[element] = offset
        } else {
            result += [-1]
            position.updateValue(offset, forKey: element)
        }
    }
    
    return result
}
