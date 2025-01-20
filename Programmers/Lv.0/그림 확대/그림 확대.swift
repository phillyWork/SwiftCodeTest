import Foundation

func solution(_ picture:[String], _ k:Int) -> [String] {
    var result: [String] = []

    for line in picture {
        // 가로로 k배 늘리기
        let stretchedLine = line.map { String(repeating: $0, count: k) }.joined()
        
        // 세로로 k배 늘리기
        for _ in 0..<k {
            result.append(stretchedLine)
        }
    }
    
    return result
}


// flatMap 활용
// 세로 확장 with 가로

// 내부적으로 가로 확장: 개별 element k개 증가
// 외부적으로 세로 확장: 해당 element를 k개 반복

// --> compactMap과의 차이점
// flatMap: return type optional
// compactMap: return type non-nil

func solution(_ picture:[String], _ k:Int) -> [String] {
    return picture.flatMap {
        Array(repeating: $0.map { String(repeating: $0, count: k) }.joined(), count: k)
    }
}
