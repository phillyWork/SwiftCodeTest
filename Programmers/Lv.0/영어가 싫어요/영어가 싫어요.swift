import Foundation

// enum 활용, 문자열 표현 --> 숫자 표현으로 변경하기

func solution(_ numbers:String) -> Int64 {
    
    enum NumInString: String {
        case zero = "zero"
        case one = "one"
        case two = "two"
        case three = "three"
        case four = "four"
        case five = "five"
        case six = "six"
        case seven = "seven"
        case eight = "eight"
        case nine = "nine"
        
        func inArabian() -> String {
            switch self {
                case .zero: return "0"
                case .one: return "1"
                case .two: return "2"
                case .three: return "3"
                case .four: return "4"
                case .five: return "5"
                case .six: return "6"
                case .seven: return "7"
                case .eight: return "8"
                case .nine: return "9"
                default: return "-1"
            }
        }
    }
    
    var temp = ""
    
    return Int64(numbers.reduce("") { prev, currStr in
        temp.append(currStr)
        if let strNum = NumInString(rawValue: temp) {
            temp.removeAll()
            return prev+strNum.inArabian()
        } else {
            return prev
        }
    }.map { String($0) }.joined())!
        
}


// enum 대신 dict로 세팅하기

func solution(_ numbers:String) -> Int64 {

    let dic = ["zero" : "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]

    var answer = numbers
    
    // (key, value) 쌍을 가지고 numbers를 교체하기
    // replcaingOccurrences
    for (k, v) in dic {
        answer = String(answer.replacingOccurrences(of: k, with: v))
    }
    
    return Int64(answer)!
}


// 별도의 데이터 타입 세팅없이 바로 적용: enumerated() 활용

func solution(_ numbers: String) -> Int64 {
    let numWords = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var result = numbers
    
    for (index, word) in numWords.enumerated() {
        result = result.replacingOccurrences(of: word, with: String(index))
    }
    
    return Int64(result)!
}
