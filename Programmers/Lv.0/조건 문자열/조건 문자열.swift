import Foundation

// enum으로 케이스 분류하기
// 비교 연산자는 타입 값이 아니기에 직접 처리 필요

func solution(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
    enum Comparison: String {
        case bigEqual = ">="
        case smallEqual = "<="
        case big = ">!"
        case small = "<!"
        
        func compare(_ a: Int, _ b: Int) -> Int {
            switch self {
                case .bigEqual: return a >= b ? 1 : 0
                case .smallEqual: return a <= b ? 1 : 0
                case .big: return a > b ? 1 : 0
                case .small: return a < b ? 1 : 0
            }
        }
    }
    
    if let comparisonOperator = Comparison(rawValue: ineq+eq) {
        return comparisonOperator.compare(n, m)
    } else {
        return 0
    }
}


// 코드 가독성 고려
// tuple로 String 인자 묶음 활용, switch 바로 활용하기

func solution(_ ineq: String, _ eq: String, _ n: Int, _ m: Int) -> Int {
    switch (ineq, eq) {
        case (">", "="): return n >= m ? 1 : 0
        case ("<", "="): return n <= m ? 1 : 0
        case (">", "!"): return n > m ? 1 : 0
        case ("<", "!"): return n < m ? 1 : 0
        default: return 0
    }
}
