import Foundation

// 세 번의 점수 합 구하기
// 굳이 최종합을 return하려고 노력하지 말고
// 각 점수를 기록할 배열로 처리해도 무방

func solution(_ dartResult:String) -> Int {
    
    enum Bonus: String {
        case single = "S"
        case double = "D"
        case triple = "T"
        
        func calculatePoint(_ num: Int) -> Int {
            switch self {
                case .single: return num
                case .double: return num * num
                case .triple: return num * num * num
            }
        }
    }
    
    enum Option: String {
        case star = "*"
        case oops = "#"
    }
    
    let dartStrArray = dartResult.map { String.init($0) }
    
    var scores = [Int]()
    var currentNum = 0
    
    for i in 0..<dartStrArray.count {
        if let num = Int(dartStrArray[i]) {
            if i > 0, let prevNum = Int(dartStrArray[i - 1]) {
                // 두 자리 숫자인 경우 (예: "10")
                currentNum = prevNum * 10 + num     // 십의 자리 만들고 일의 자리 수 더하기
                scores.removeLast()                 // 이전에 추가된 한 자리 숫자를 제거
            } else {
                currentNum = num
            }
            scores.append(currentNum)               // 숫자 정보 저장
        } else if let bonusCase = Bonus(rawValue: dartStrArray[i]) {
            
            let lastIndex = scores.count - 1        // 가장 최근 숫자 정보 위치
            scores[lastIndex] = bonusCase.calculatePoint(scores[lastIndex])     // 보너스 계산 적용값으로 update
            
        } else if let optionCase = Option(rawValue: dartStrArray[i]) {
            
            let lastIndex = scores.count - 1
            switch optionCase {
                case .star:
                    scores[lastIndex] *= 2          // 옵션 계산 적용
                    if lastIndex > 0 {              // 바로 이전 점수도 2배 (첫번째: 자체 값 2배만 작업하면 끝)
                        scores[lastIndex - 1] *= 2
                    }
                case .oops:
                    scores[lastIndex] *= -1
                
            }
        }
    }
    
    return scores.reduce(0, +)
}



// 참고

// 숫자 목록 배열
// 문자(보너스, 옵션) 배열

// split(whereSeparator:)
// 조건 부합하는 element 건너 뛰고 나눠서 배열 반환

// zip으로 두 배열 묶어서 처리

func solution(_ dartResult:String) -> Int {
    
    // 문자열(보너스), *, #인 경우 건너뛰기
    let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
    
    // 숫자 건너뛰기
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})
    
    var totalScore = 0
    
    for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
        var score = 0
        if let number = Int(number) {
            // 보너스 점수 계산 적용
            score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number
        }
        
        // 옵션 계산
        if letter.contains("*") {
            score *= 2
        } else if letter.contains("#") {
            score = -score
        }
        
        // 마지막 세번째 이외의 경우, 다음 번 옵션이 *라면 2배 필요

        // e.g.) 첫번째도 *, 두번째도 *, 세번째도 *
        // 첫번째 계산: 자체 옵션에서 *, 두번째에서 *로 2배 추가 필요
        // 두번째 계산: 자체 옵션에서 *, 세번째에서 *로 2배 추가 필요
        // 세번째: 위의 옵션 계산에서 처리, 뒤가 없으므로 끝

        if i != 2 {
            if letterList[i + 1].contains("*") {
                score *= 2
            }
        }
        
        totalScore += score
    }
    
    return totalScore
}


// 해설
// 문자열 처리(String Manipulation)를 묻는 문제입니다.
// 앞에서부터 한 글자씩 잘라서 처리할 수 있고, 또는 간단한 컴파일러를 만들듯이 토큰화(Tokenizing)와 의미 분석(Semantic Analysis)을 통해 어렵지 않게 계산할 수 있습니다.
// 점수 중에는 한 자리뿐만 아니라 두 자리인 10점도 포함되어 있기 때문에 한 글자씩 잘라서 처리할때는 그 부분에 유의해야겠네요.
// 토큰화로 처리할 때는 정규식을 사용하면 비교적 쉽게 잘라낼 수 있습니다.
// S, D, T는 각각 원점수, 제곱, 세제곱으로 처리하고 스타상은 두 배로 계산하면 됩니다.
// 참, 아차상은 마이너스 점수라는 점에 유의하세요.
