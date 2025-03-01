import Foundation

// 조건대로 작성

func solution(_ arr:[Int]) -> [Int] {
    
    var stk = [Int]()
    var i = 0
    
    while i < arr.count {
        if stk.isEmpty {
            stk.append(arr[i])
        } else {
            if stk.last == arr[i] {
                stk.removeLast()
            } else {
                stk.append(arr[i])
            }
        }
        i += 1
    }
    
    return stk.isEmpty ? [-1] : stk
}

// forEach 활용, 각 index의 요소들 비교하기

func solution(_ arr:[Int]) -> [Int] {
    var stack = [Int]()
    arr.forEach {
        if let last = stack.last, last == $0 { stack.removeLast() }
        else { stack.append($0) }
    }
    return stack.isEmpty ? [-1] : stack
}

