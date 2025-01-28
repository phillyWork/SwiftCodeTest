import Foundation

// 의도
// replacingOccurences로 빈칸 제거
// 왼쪽 항과 오른쪽 항 숫자 받고, 연산 처리 기호를 바탕으로 Bool값 처리
// 마지막에 해당 값들 기반으로 연산해서 결과 도출하기

func solution(_ quiz:[String]) -> [String] {
    return quiz.map {
        let result = String.init($0)
            .replacingOccurrences(of: " ", with: "")
            .reduce([0, 0, false, false, false, false, false, 0]) { (result, current) in
                print(result, current)
                var (firstOperand, secondOperand, isFirstOperandDone, isOperationMinus, isAllDone, isRightMinus, right) =
                (result[0] as! Int, result[1] as! Int, result[2] as! Bool, result[3] as! Bool, result[4] as! Bool, result[5] as! Bool, result[6] as! Int)
                switch current {
                case "-":
                    if isAllDone {
                        isRightMinus = true
                    } else if isFirstOperandDone {
                        isOperationMinus = true
                    } else {
                        firstOperand *= -1
                    }
                case "+":
                    isOperationMinus = false
                    isFirstOperandDone = true
                case "=":
                    isAllDone = true
                default:
                    let num = Int(String(current))!
                    if isAllDone {
                        // 오른쪽 항
                        right = right * 10 + num
                    } else if isFirstOperandDone {
                        secondOperand = secondOperand * 10 + num
                    } else {
                        firstOperand = firstOperand * 10 + num
                    }
                }
                
                return [firstOperand, secondOperand, isFirstOperandDone, isOperationMinus, isAllDone, isRightMinus, right]
            }
        let firstOperand = result[0] as! Int
        let secondOperand = result[1] as! Int
        let isOperationMinus = result[3] as! Bool
        let isRightMinus = result[5] as! Bool
        let right = result[6] as! Int
        
        let left = isOperationMinus ? firstOperand - secondOperand : firstOperand + secondOperand
        let expectedRight = isRightMinus ? -right : right
        
        return left == expectedRight ? "O" : "X"
    }
}


// 에러: reduce에서 관리할 값 너무 많음
// 시스템 오류 발생


// 해결: 공백 기준으로 문자열 분리, Int 변환 수행하기
// 굳이 reduce로 한번에 처리하지 말고 나눠서 수행하기

func solution(_ quiz:[String]) -> [String] {
    return quiz.map { equation in
        let components = equation.split(separator: " ")
        guard components.count == 5,
              let X = Int(components[0]),
              let Y = Int(components[2]),
              let Z = Int(components[4]) else {
            return "X"
        }
        
        let result: Int
        if components[1] == "+" {
            result = X + Y
        } else {
            result = X - Y
        }
        
        return result == Z ? "O" : "X"
    }
}


// 한 번에 경우의 수 처리하기

func solution(_ quiz: [String]) -> [String] {
    return quiz.map {
        let arr = $0.split(separator: " ")
        return arr[1] == "+" && Int(arr[0])! + Int(arr[2])! == Int(arr[4])! || arr[1] == "-" && Int(arr[0])! - Int(arr[2])! == Int(arr[4]) ? "O" : "X"
    }
}
