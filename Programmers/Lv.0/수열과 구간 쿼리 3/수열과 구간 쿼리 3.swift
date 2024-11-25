import Foundation

// 단순 element 교환
// temp로 임시 저장, 그 후 값 할당하기

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    
    var result = arr
    
    for query in queries {
        var temp = result[query[0]]
        result[query[0]] = result[query[1]]
        result[query[1]] = temp
    }
    
    return result
}


// swapAt 메서드 활용

// reduce 활용해서 arr에서 시작, queries의 각 element를 적용하면서 arr 변형 값 반환하기

// 시간복잡도: O(1)

func solution(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    return queries.reduce(into: arr) { result, query in
        result.swapAt(query[0], query[1])
    }
}

