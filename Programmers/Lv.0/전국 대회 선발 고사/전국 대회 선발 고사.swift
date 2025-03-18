import Foundation

// 참가 가능 여부의 학생들 중, rank 배열의 index 값을 뽑아내기 by rank[index] 순서로
// enumerated로 offset과 element로 구분, 참가 가능 여부로 filter
// 순위가 낮을 수록 높은 등수이므로 sorted로 정렬
// 최종적으로 index값이 필요하므로 offset 구하기

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    
    let result = rank.enumerated()
                    .filter { attendance[$0.offset] }
                    .sorted { $0.element < $1.element }
                    .map { $0.offset }

    return 10000*result[0] + 100*result[1] + result[2]
}


// filter 대신 for문에서 where로 조건 추가

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    var selected = [(rank: Int, index: Int)]()
    
    for (i, r) in rank.enumerated() where attendance[i] {
        selected.append((r, i))
    }
    
    selected.sort(by: { $0.rank < $1.rank }) // 등수 기준 정렬 (O(n log n))

    let (a, b, c) = (selected[0].index, selected[1].index, selected[2].index)
    return 10000 * a + 100 * b + c
}

