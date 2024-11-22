import Foundation

// score 길이: score.count
// 상위 k위: 0 ~ k-1 까지만...
// 전당 array count: k
// --> 그 중 min값 찾아서 return

func solution(_ k:Int, _ score:[Int]) -> [Int] {

    var hof = score[0...k-1].sorted(by: >)
    
    return score.enumerated().map {
        if $0.offset < k {
            return hof[k-1]
        } else {
            if $0.element > hof[k-1] {
                hof.removeLast()
                hof.append($0.element)
                hof.sort(by: >)
            }
            return hof[k-1]
        }
    }
    
}

// 오류 발생
// 1. score.count가 항상 k보다 크다는 전제가 없음
// 2. map 함수 활용: 불변 데이터 변환 목적이지만 hof를 매번 수정함 --> 단순 반복문이 더 나음


// 해결: 반복문 돌면서 sort, k개 넘어가면 마지막 element 지우기 작업 처리

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    var hof = [Int]()
    var result = [Int]()
    
    for s in score {
        hof.append(s)
        hof.sort(by: >)
        
        if hof.count > k {
            hof.removeLast()
        }
        
        if let min = hof.last {
            result.append(min)
        }
    }
    
    return result
    
}
