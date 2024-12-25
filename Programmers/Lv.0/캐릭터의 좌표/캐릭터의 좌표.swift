import Foundation

// 가로, 세로: 0 기준 좌우 1/2 칸씩 범위

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {

    enum InputOrder: String {
        case up = "up"
        case down = "down"
        case left = "left"
        case right = "right"
        
        func checkAvailable(_ prev: [Int], _ board: [Int]) -> Bool {
            switch self {
                case .up: return prev[1]+1 <= (board[1]-1)/2
                case .down: return prev[1]-1 >= -(board[1]-1)/2
                case .left: return prev[0]-1 >= -(board[0]-1)/2
                case .right: return prev[0]+1 <= (board[0]-1)/2
            }
        }
        
        func takeOrder(_ prev: [Int]) -> [Int] {
            switch self {
                case .up: return [prev[0], prev[1]+1]
                case .down: return [prev[0], prev[1]-1]
                case .left: return [prev[0]-1, prev[1]]
                case .right: return [prev[0]+1, prev[1]]
            }
        }
    }
    
    return keyinput.reduce([0,0]) { prev, input in
        guard let order = InputOrder(rawValue: input) else {
            return prev
        }
        if order.checkAvailable(prev, board) {
            return order.takeOrder(prev)
        } else {
            return prev
        }
    }
}


// 개선: switch 안에 where로 조건 추가하기

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var x = 0, y = 0

    keyinput.forEach {
        switch $0 {
        case "up" where y < ((board[1] - 1) / 2): y += 1
        case "down" where y > -((board[1] - 1) / 2): y -= 1
        case "right" where x < ((board[0] - 1) / 2): x += 1
        case "left" where x > -((board[0] - 1) / 2): x -= 1
        default: break
        }
    }

    return [x, y]
}

