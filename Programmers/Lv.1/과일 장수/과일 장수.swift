import Foundation

// 한 번 상자가 구성되면 최저점 기준 사과 개수 * 최저점으로 점수 계산
// 최대 점수를 얻고 싶다면 상자 당 최저점이 높도록 배열 구성
// sort로 최고점부터 나타내서 배열 구성하도록 함

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    // 최고점이 1이면 모두 1점으로 구성: 상자 개수 * m으로 점수 얻기 위함
    if k == 1 { return m * (score.count / m) }
    
    let sortedScore = score.sorted(by: >)
    
    return stride(from: 0, to: score.count-1, by: m).map { startIndex in
        if (startIndex+m-1 <= score.count-1) {
            return sortedScore[startIndex+m-1] * m
        } else {
            return 0
        }
    }.reduce(0, +)
    
}


// 문제점: map 함수 적용 후 조건문 통과, 그 이후 reduce 처리
// 시간처리 오래 걸림 + 가독성

// 해결: reduce로 한번에 처리하기
// 각 배열당 시작 위치가 아니라 가장 낮은 점수 위치에서 stride 구성
// 각 배열의 점수 바로 계산하도록 처리 + 남은 사과 개수 굳이 따질 필요도 없음 (배열 생성되지 못하면 점수 계산하지 않음)

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let s = score.sorted(by: >)
    return stride(from: m-1, to: score.count, by: m).reduce(0) { $0 + s[$1] * m }
}
