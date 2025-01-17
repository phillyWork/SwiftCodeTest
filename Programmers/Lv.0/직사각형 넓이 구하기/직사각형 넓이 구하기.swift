import Foundation

// x, y값 중첩되지 않도록 구하기
// 직사각형: 가로 길이 * 세로 길이 ~ 각 길이마다 좌표 2개만 존재 --> 빼기 절대값 활용

func solution(_ dots:[[Int]]) -> Int {
    
    var xDots = [Int]()
    var yDots = [Int]()
    
    dots.forEach {
        if !xDots.contains($0[0]) { xDots.append($0[0]) }
        if !yDots.contains($0[1]) { yDots.append($0[1]) }
    }
    
    return abs(xDots[0] - xDots[1]) * abs(yDots[0] - yDots[1])
}


// 다른 접근

// 4개의 좌표값 크기 순으로 미리 정렬
// x좌표에서 큰 값 - 작은 값
// y좌표에서 큰 값 - 작은 값

func solution(_ dots:[[Int]]) -> Int {
    let dots = dots.sorted(by: { ($0[0], $0[1]) < ($1[0], $1[1]) })
    return (dots.last![0] - dots.first![0]) * (dots.last![1] - dots.first![1])
}
