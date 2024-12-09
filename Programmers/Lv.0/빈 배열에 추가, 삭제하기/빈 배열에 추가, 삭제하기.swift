import Foundation

// 기본 풀이: 중첩 for문 활용, T/F에 따라 필요한 작업 수행

func solution(_ arr:[Int], _ flag:[Bool]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<flag.count {
        if flag[i] {
            for j in 0..<arr[i]*2 {
                result.append(arr[i])
            }
        } else {
            for j in 0..<arr[i] {
                result.popLast()!
            }
        }
    }
    
    return result
}


// 개선: 중첩 for문 지양하기
// 한번에 반복적인 element 추가, 삭제하기

// removeLast(_:)
// Removes the specified number of elements from the end of the collection.
// 마지막 element 기준으로 arr[i]개의 element 제거

func solution(_ arr: [Int], _ flag: [Bool]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<flag.count {
        if flag[i] {
            // repeatElement와 append(contentsOf:)를 사용
            result.append(contentsOf: Array(repeating: arr[i], count: arr[i] * 2))
        } else {
            // Array의 removeLast(_:)를 사용하여 한 번에 제거
            result.removeLast(arr[i])
        }
    }
    
    return result
}
