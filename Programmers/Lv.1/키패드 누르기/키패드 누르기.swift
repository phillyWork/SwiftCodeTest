import Foundation

// 가운데 열의 버튼 위치에 따른 왼손 vs. 오른손 결정
// 왼손과 오른손 현재 위치에 대한 위치값이 필요
// 현재 버튼에서 가까울 수록 해당 손을 활용

// 열과 행 값을 저장하는 구조체 활용
struct NumButton {
    let row: Int
    let col: Int
}

// 키패드 위치값을 반환하는 열거형 활용
enum Numbers: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case star = "*"
    case zero = "0"
    case sharp = "#"
    
    var buttonPos: NumButton {
        switch self {
            case .one: return NumButton(row: 0, col: 0)
            case .two: return NumButton(row: 0, col: 1)
            case .three: return NumButton(row: 0, col: 2)
            case .four: return NumButton(row: 1, col: 0)
            case .five: return NumButton(row: 1, col: 1)
            case .six: return NumButton(row: 1, col: 2)
            case .seven: return NumButton(row: 2, col: 0)
            case .eight: return NumButton(row: 2, col: 1)
            case .nine: return NumButton(row: 2, col: 2)
            case .star: return NumButton(row: 3, col: 0)
            case .zero: return NumButton(row: 3, col: 1)
            case .sharp: return NumButton(row: 3, col: 2)
        }
    }
}

// 이동: 상하좌우 한칸씩만 가능
// 행 위치 차이값 + 열 위치 차이값 더한 최종 위치값 차이를 비교
// 절대 위치 비교이므로 abs 활용
// 더 작은쪽이 더 가까운 손이므로 해당 손을 선택

// e.g.) 8
// left: 4, right: 6
// left 차이 ~ row: -1, col: -1
// right 차이 ~ row: -1, col: +1
// 키패드 위치상 동일한 거리 차이

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var leftPosition = Numbers(rawValue: "*")!
    var rightPosition = Numbers(rawValue: "#")!
    
    func setPositionWithLeft(_ isLeft: Bool, _ button: Numbers) -> String {
        if isLeft {
            leftPosition = button
            return "L"
        } else {
            rightPosition = button
            return "R"
        }
    }
    
    return numbers.map { num in
            if [1, 4, 7].contains(num) {
                return setPositionWithLeft(true, Numbers(rawValue: String(num))!)
            } else if [3, 6, 9].contains(num) {
                return setPositionWithLeft(false, Numbers(rawValue: String(num))!)
            } else {
                let current = Numbers(rawValue: String(num)) ?? Numbers.zero
                
                let leftPosDiff = abs(leftPosition.buttonPos.row - current.buttonPos.row) + abs(leftPosition.buttonPos.col - current.buttonPos.col)
                let rightPosDiff = abs(rightPosition.buttonPos.row - current.buttonPos.row) + abs(rightPosition.buttonPos.col - current.buttonPos.col)
               
                if leftPosDiff == rightPosDiff {
                    return hand == "right" ? setPositionWithLeft(false, Numbers(rawValue: String(num))!) : setPositionWithLeft(true, Numbers(rawValue: String(num))!)
                } else if leftPosDiff > rightPosDiff {
                    return setPositionWithLeft(false, Numbers(rawValue: String(num))!)
                } else {
                    return setPositionWithLeft(true, Numbers(rawValue: String(num))!)
                }
            }
    }.joined()
}



// *과 #을 음수로 처리하기
// 키패드 이동 거리 계산
func countKeypad(_ start: Int , _ dest: Int) -> Int {
    // [ 1, 2,  3]
    // [ 4, 5,  6]
    // [ 7, 8,  9]
    // [-1, 0, -2]
    let keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [-1, 0, -2]]
    var startPos = [0, 0]
    var destPos = [0, 0]

    for i in 0..<4 {
        for j in 0..<3 {
            if keypad[i][j] == start {
                startPos[0] = i
                startPos[1] = j
            }
            if keypad[i][j] == dest {
                destPos[0] = i
                destPos[1] = j
            }
        }
    }

    var count = 0
    for i in 0...1 {
        count += startPos[i] > destPos[i] ? startPos[i] - destPos[i] : destPos[i] - startPos[i]
    }

    return count
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var LH = -1
    var RH = -2
    var result = ""

    for n in numbers {
        switch n {
        case 1, 4, 7:
            LH = n
            result += "L"
            break

        case 3, 6, 9:
            RH = n
            result += "R"
            break

        default:
            let countLH = countKeypad(LH, n)
            let countRH = countKeypad(RH, n)

            // 같은거리면 왼손잡이 오른손잡이로 누름
            if countLH == countRH {
                if hand == "left" {
                    LH = n
                    result += "L"
                } else {
                    RH = n
                    result += "R"
                }
                break
            }

            // 가까운 손으로 누름
            if countLH < countRH {
                LH = n
                result += "L"
            } else {
                RH = n
                result += "R"
            }
            break
        }
    }

    return result
}
