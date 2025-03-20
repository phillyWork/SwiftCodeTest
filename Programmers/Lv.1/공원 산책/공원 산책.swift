import Foundation

// 체크할 사항
// 1. 이동한 곳이 범위를 넘었는지
// 2. 이동 과정에서 장애물을 만났는지 여부

// 이동 과정에서 체크해야 하므로 바로 이동해야할 양만큼 이동하는 것이 아니라 이동해야할 양만큼 매번 이동하면서 장애물 여부를 체크

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    var parkStructure = [[String]]()
    var result = [0, 0]
    
    for i in 0..<park.count {
        if park[i].contains("S") {
            for j in 0..<park[i].count {
                if String(Array(park[i])[j]) == "S" {
                    result = [i, j]
                }
            }
        }
        parkStructure.append(park[i].map { String($0) })
    }
    
    for route in routes {
        let order = route.split(separator: " ")
        guard let amount = Int(order[1]) else { return result }
        switch order[0] {
            case "E":
                if result[1] + amount < parkStructure[result[0]].count {
                    var temp = 1
                    var isAvailable = true
                    while temp <= amount {
                        if parkStructure[result[0]][result[1]+temp] == "X" {
                            isAvailable = false
                            break
                        }
                        temp += 1
                    }
                    if isAvailable {
                        result[1] += amount
                    }
                }
            case "W":
                if result[1] - amount >= 0 {
                    var temp = 1
                    var isAvailable = true
                    while temp <= amount {
                        if parkStructure[result[0]][result[1]-temp] == "X" {
                            isAvailable = false
                            break
                        }
                        temp += 1
                    }
                    if isAvailable {
                        result[1] -= amount
                    }
                }
            case "S":
                if result[0] + amount < parkStructure.count {
                    var temp = 1
                    var isAvailable = true
                    while temp <= amount {
                        if parkStructure[result[0]+temp][result[1]] == "X" {
                            isAvailable = false
                            break
                        }
                        temp += 1
                    }
                    if isAvailable {
                        result[0] += amount
                    }
                }
            case "N":
                if result[0] - amount >= 0 {
                    var temp = 1
                    var isAvailable = true
                    while temp <= amount {
                        if parkStructure[result[0]-temp][result[1]] == "X" {
                            isAvailable = false
                            break
                        }
                        temp += 1
                    }
                    if isAvailable {
                        result[0] -= amount
                    }
                }
            default: break
        }
    }
    
    return result
}


// 개선사항

// switch에서 공통 처리 작업을 move 함수로 따로 분리
// 이동 가능 여부 체크를 isValid 함수로 따로 분리

func solution(_ park: [String], _ routes: [String]) -> [Int] {
    let park = park.map { $0.map { String($0) }}
    let col = park.count
    let row = park[0].count
    
    // 명령 방향 딕셔너리
    let direction: [String: (Int, Int)] = [
        "N": (-1, 0),
        "S": (1, 0),
        "W": (0, -1),
        "E": (0, 1)
    ]
    
    // 로봇 강아지 초기 위치 찾기
    var (x, y) = findStart(park)
    
    // 명령어 처리 함수
    func move(_ op: String, _ n: Int) {
        let d = direction[op]!
        for _ in 1...n {
            let (nX, nY) = (x + d.0, y + d.1)
            if !isValid(nX, nY, col, row) || park[nX][nY] == "X" {
                return
            }
            (x, y) = (nX, nY)
        }
    }
    
    // 유효한 위치인지 확인하는 함수
    func isValid(_ x: Int, _ y: Int, _ col: Int, _ row: Int) -> Bool {
        return x >= 0 && y >= 0 && x < col && y < row
    }
    
    // 시작 위치 찾기 함수
    func findStart(_ park: [[String]]) -> (Int, Int) {
        for i in 0..<col {
            for j in 0..<row where park[i][j] == "S" {
                return (i, j)
            }
        }
        fatalError("Start position not found")
    }
    
    // 명령어 처리
    for route in routes {
        let components = route.split(separator: " ")
        guard components.count == 2 else { continue }
        guard let n = Int(components[1]) else { continue }
        let op = String(components[0])
        
        if let dir = direction[op] {
            move(op, n)
        }
    }
    
    return [x, y]
}
