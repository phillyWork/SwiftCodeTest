import Foundation

// 한번에 m씩 처리
// 정해진 구역은 무조건 1번은 해야 함
// 다시 칠해지는 것은 상관 없음

// 0 ~ n까지의 배열 생성
// 1로 초기화 후 section에 포함된 위치 구역은 0 할당
// 아직 칠해져 있지 않다면 다음 시작 위치로 m만큼 이동
// 중간에 같이 칠해져야 하는 경우: 동일한 횟수로 취급

// e.g.
// n: 8, m: 3, section: [2, 3, 6]
// 2에서 칠하기 ~ 다음 위치: 5
// 중간의 3: 2를 칠하면서 같이 칠해짐
// count는 1만 추가

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var wall = Array(repeating: 1, count: n+1)
    var count = 0
    var index = section[0]
    
    for element in section {
        wall[element] = 0
    }
    
    while index < wall.count {
        if wall[index] == 0 {
            count += 1
            wall[index] = 1
            index += m
        } else {
            index += 1
        }
    }
    
    return count
}


// 개선: 굳이 0 ~ n까지의 배열을 만들 필요 없음
// section의 element만 활용하기

// 직전 칠한 위치의 index가 section의 element보다 작다면 칠할 횟수 추가하기

func solution(_ n: Int, _ m: Int, _ section: [Int]) -> Int {
    var count = 0
    var lastPainted = 0             // 마지막 칠한 위치
    
    for area in section {
        if area > lastPainted {     // 칠할 구역이 마지막 칠한 위치보다 클 경우: 새롭게 칠해야 함
            count += 1
            lastPainted = area + m - 1      // 새롭게 칠한 위치
        }
    }
    
    return count
}


