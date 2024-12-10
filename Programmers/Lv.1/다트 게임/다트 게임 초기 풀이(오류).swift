import Foundation

// 예제 테스트는 모두 통과
// 실제 테스트: 2가지에서 불통

// 고려할 점

// 1. 점수 누적 타이밍
// 현재 상태와 이전 상태 모두 관리 --> 복잡도 올라감

// 2. 두 자리 숫자 처리
// currentNum의 초기화 시점 불확실
// 이전 다트 점수 계산 완료 후 초기화 애매

// 3. 옵션 적용 타이밍
// 현재 점수와 이전 점수 직접 추적, 동시 갱신 --> 누적 값 오류 발생

// 4. 마지막 다트 점수 합산 타이밍
// 조건 따라서 중복으로 더해질 수 있는 오류 가능성
// 차라리 외부에서 마지막 다트 점수를 처리하도록 구조 개선이 더 나아보임

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
    
    var result = 0
    
    var currentNum = 0
    var previousPoint = 0
    var currentPoint = 0
    
    let dartStrArray = dartResult.map { String.init($0) }
    
    for i in 0..<dartStrArray.count {
        if let num = Int(dartStrArray[i]) {
            
            // 처음 숫자 or 이전이 옵션/보너스 인 경우: 다시 처음으로 숫자인 경우
            if i == 0 || Int(dartStrArray[i-1]) == nil {
                // 이전 계산값 더하고 정리하기
                print("result so far: \(result), prev: \(previousPoint), current: \(currentPoint)")
                result += currentPoint
                previousPoint = currentPoint
                currentPoint = 0
                currentNum = 0
            }
            
            if let nextNum = Int(dartStrArray[i+1]) {
                print("decimal point")
                currentNum += num
                currentNum *= 10
                print("currentNum: \(currentNum)")
            } else {
                currentNum += num
            }
        } else if let bonusCase = Bonus(rawValue: dartStrArray[i]) {
            print("bonus point: \(bonusCase.calculatePoint(currentNum))")
            currentPoint += bonusCase.calculatePoint(currentNum)
            if i+1 == dartStrArray.count {
                print("last case without option")
                // 마지막 경우: 옵션 없이 숫자 계산으로 끝나는 경우
                result += currentPoint
            }
        } else if let optionCase = Option(rawValue: dartStrArray[i]) {
            switch optionCase {
                case .star:
                print("should double both prev and current")
                print("before: \(currentPoint)")
                    currentPoint *= 2
                    currentPoint += previousPoint
                print("after: \(currentPoint)")
                case .oops:
                print("should minus current")
                    currentPoint *= -1
            }
            if i+1 == dartStrArray.count {
                print("last case with option")
                // 마지막 경우: 옵션으로 끝나는 경우
                result += currentPoint
            }
        }
    }
    
    return result
}
