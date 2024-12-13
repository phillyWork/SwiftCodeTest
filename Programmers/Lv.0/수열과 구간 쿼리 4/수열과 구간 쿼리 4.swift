import Foundation

// 단순 해결: queries의 각 query마다 k의 배수, 즉 k로 나눈 나머지가 0인 i를 발견할 때마다 arr[i]값에 +1

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    
    for query in queries {
        for i in query[0]..<query[1]+1 {
            if i%query[2] == 0 {
                result[i] += 1
            }
        }
    }
    
    return result
}

// 개선: 코드 가독성 측면
// for문 대신 forEach 활용
// query의 index로 주는 것보다 지역변수 할당해서 의미 명확하게 하기

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var arr = arr
    queries.forEach {
        let (s, e, k) = ($0[0], $0[1], $0[2])
        (s...e).forEach { if $0 % k == 0 { arr[$0] += 1 } }
    }
    return arr
}
