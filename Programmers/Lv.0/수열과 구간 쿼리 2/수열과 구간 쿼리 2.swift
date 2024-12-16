import Foundation

// 단순 해결: 각 query마다 (s...e) 사이에 존재하는 i를 index로 하는 arr의 element 구하기
// 가장 작은 값 혹은 -1 구하기

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var sol = [Int]()
    for query in queries {
        let (s, e, k) = (query[0], query[1], query[2])
        
        var result = [Int]()
        
        for i in s...e {
            if arr[i] > k {
                result.append(arr[i])
            }
        }
        
        sol.append(result.count == 0 ? -1 : result.min()!)
    }
    
    return sol
}

// map 함수 활용
// (s...e)를 query로 활용, filter 통해 k보다 큰 element만 남기기

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    return queries.map { query in
        return (query[0]...query[1]).map { arr[$0] }.filter { $0 > query[2] }
    }.map { $0.count == 0 ? -1 : $0.min()! }
}


// 개선
// query element 대신 직접 s, e, k로 활용하기 (가독성)
// min() 값 구할 때, nil인 경우 -1 할당하도록 ?? 병합 연산자 (Nil-Coalescing Operator) 활용, map 함수 1번만 활용하기
func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    return queries.map {
        let (s, e, k) = ($0[0], $0[1], $0[2])
        return Array(arr[s...e]).filter { $0 > k }.min() ?? -1
    }
}
