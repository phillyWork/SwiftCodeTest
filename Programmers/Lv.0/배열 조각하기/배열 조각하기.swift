import Foundation

// prefix, suffix 활용 앞, 뒤로 부분 잘라서 활용하기
// 전체 길이 초과하는지 여부 매번 체크 필요

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    
    var result = arr
    
    for i in 0..<query.count {
        let index = query[i]
        
        // query[i]가 result의 길이를 초과하지 않도록 안전한 범위 체크
        guard index < result.count else { break }
        
        if i % 2 == 0 {
            result = Array(result.prefix(index + 1)) // 앞부분 유지
        } else {
            result = Array(result.suffix(result.count - index)) // 뒷부분 유지
        }
    }
    
    return result
}


// index 계산으로 시작 & 끝 지점 매번 계산
// 원본 배열에서 해당 부분만큼 가져오기

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var left = 0, right = arr.count - 1
    query.enumerated().forEach {
        if $0.offset % 2 == 0 { right = left + $0.element }
        else { left += $0.element }
    }
    let arr = Array(arr[left..<right])
    return arr.isEmpty ? [-1] : arr
}
