import Foundation

// slicer: a, b, c

func solution(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
    switch n {
        case 1:
            // 0 ~ b
            return Array(num_list[0...slicer[1]])
        case 2:
            // a ~ last
            return Array(num_list[slicer[0]...num_list.count-1])
        case 3:
            // a ~ b
            return Array(num_list[slicer[0]...slicer[1]])
        default:
            // stride a ~ b, by c
            return stride(from: slicer[0], through: slicer[1], by: slicer[2]).map { num_list[$0] }
    }
}

// sequence(first:next:)
// first: 시작값
// next: 다음 값 생성 클로저, 현재 값에 간격을 결정하는 값 더하기

// prefix(while:)
// 조건따라 시퀀스 자르기
// 슬라이싱 범위 제한

func solution(_ n: Int, _ slicer: [Int], _ numList: [Int]) -> [Int] {
    return sequence(first: n == 1 ? 0 : slicer[0], next: { $0 + (n == 4 ? slicer[2] : 1) })
    .prefix(while: { $0 <= (n == 2 ? numList.count - 1 : slicer[1]) })
    .map { numList[$0] }
}
