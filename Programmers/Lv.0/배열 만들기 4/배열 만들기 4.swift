import Foundation

// 문제 요구 사항대로 만들기

func solution(_ arr:[Int]) -> [Int] {
    
    var stk = [Int]()
    var i = 0
    
    while i < arr.count {
        if stk.isEmpty {
            stk.append(arr[i])
            i += 1
        } else if let lastElement = stk.last {
            if lastElement < arr[i] {
                stk.append(arr[i])
                i += 1
            } else {
                stk.removeLast()
            }
        }
    }
    
    return stk
}


// 개선: 매번 last 존재하는지 보다 guard문으로 먼저 없는 경우 처리하기

func solution(_ arr: [Int]) -> [Int] {
    var stk = [Int]()
    var i = 0
    
    while i < arr.count {
        guard let last = stk.last else {
            // stk가 비어 있으면 arr[i] 추가
            stk.append(arr[i])
            i += 1
            continue
        }
        
        if last < arr[i] {
            // 마지막 원소가 arr[i]보다 작으면 추가
            stk.append(arr[i])
            i += 1
        } else {
            // 마지막 원소가 arr[i]보다 크거나 같으면 제거
            stk.removeLast()
        }
    }
    
    return stk
}
