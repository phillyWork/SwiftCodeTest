import Foundation

// 매번 arr를 처리하도록 해서 원소 비교하기

func changeArr(_ arr: [Int]) -> [Int] {
    return arr.map { num in
        if num >= 50 && num%2 == 0 { return num / 2 }
        else if num < 50 && num%2 == 1 { return num * 2 + 1 }
        else { return num }
    }
}

func solution(_ arr:[Int]) -> Int {
    
    var x = 0
    var setUp = arr
    
    while true {
        let first = setUp
        let second = changeArr(first)
        
        var isSame = true
        
        for i in 0..<first.count {
            if first[i] != second[i] {
                isSame = false
                break
            }
        }
        
        if isSame {
            break
        } else {
            x += 1
            setUp = second
        }
    }
    
    return x
}

// setup array as one line

func solution(_ arr:[Int]) -> Int {
    var currentArr = arr
    var previousArr: [Int] = []
    var x = -1
    
    while currentArr != previousArr {
        x += 1
        previousArr = currentArr
        currentArr = currentArr.map { ($0 >= 50 && $0 % 2 == 0) ? $0 / 2 : ($0 < 50 && $0 % 2 == 1) ? $0 * 2 + 1 : $0 }
    }
    
    return x
}

