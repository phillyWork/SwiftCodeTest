import Foundation

// arr 요소들 배열에 추가하기
// k개보다 적으면 일치할 때까지 -1 추가하기

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    
    var result = [Int]()
    
    for num in arr {
        guard result.count != k else { break }
        
        if !result.contains(num) {
            result.append(num)
        }
    }
    
    while result.count < k {
        result.append(-1)
    }
    
    return result
}


// 개선
// 매번 contains 메서드 활용: O(n) 걸림
// 차라리 Set으로 존재여부 미리 체크: O(1) 걸림

func solution(_ arr: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var checked = Set<Int>()

    for num in arr {
        if result.count == k { break }
        if !checked.contains(num) {
            checked.insert(num)
            result.append(num)
        }
    }
    
    result.append(contentsOf: Array(repeating: -1, count: k - result.count))
    
    return result
}
