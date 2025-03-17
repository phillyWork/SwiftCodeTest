import Foundation

// 드래그 시작점: 가장 왼쪽에 위치한 문서의 y좌표, 가장 상단에 위치한 문서의 x좌표 포함하도록 자리 잡기
// 드래그 완료점: 가장 오른쪽에 위치한 문서의 y좌표, 가장 하단에 위치한 문서의 x좌표 포함도록 자리 잡기

func solution(_ wallpaper:[String]) -> [Int] {
    
    var minX = 50, minY = 50, maxX = 0, maxY = 0
    
    for i in 0..<wallpaper.count {
        if wallpaper[i].contains("#") {
            minX = min(minX, i)
            maxX = max(maxX, i)
            
            for j in 0..<wallpaper[i].count {
                if String(Array(wallpaper[i])[j]) == "#" {
                    minY = min(minY, j)
                    maxY = max(maxY, j)
                }
            }
        }
    }
    
    return [minX, minY, maxX+1, maxY+1]
}


// 개선
// 결국 모든 바탕화면 파일 여부 확인해야함

// contains 및 # 여부 매번 체크하는 것을 줄이기 --> where로 조건 추가

func solution(_ wallpaper: [String]) -> [Int] {
    var minX = 50, minY = 50, maxX = 0, maxY = 0
    
    for (i, row) in wallpaper.enumerated() {
        for (j, char) in row.enumerated() where char == "#" {
            minX = min(minX, i)
            maxX = max(maxX, i)
            minY = min(minY, j)
            maxY = max(maxY, j)
        }
    }
    
    return [minX, minY, maxX + 1, maxY + 1]
}
