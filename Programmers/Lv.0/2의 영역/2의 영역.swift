import Foundation

// 2의 index 모음집 구하기 --> [가장 작은 index ... 가장 큰 index]

func solution(_ arr:[Int]) -> [Int] {
    let twoIndexes = arr.enumerated().filter { $0.element == 2 }.map { $0.offset }
    if twoIndexes.isEmpty {
        return [-1]
    } else {
        return Array(arr[twoIndexes.first!...twoIndexes.last!])
    }
}


// filter 없이 가장 먼저 등장하는 index와 가장 나중에 등장하는 index 구하기

func solution(_ arr:[Int]) -> [Int] {
    if let s = arr.firstIndex(of: 2), let e = arr.lastIndex(of: 2) {
        return Array(arr[s...e])
    } else {
        return [-1]
    }
}


// 2 포함 여부 따지기

func solution(_ arr: [Int]) -> [Int] {
    return arr.contains(2) ? Array(arr[arr.firstIndex(of: 2)!...arr.lastIndex(of: 2)!]) : [-1]
}
