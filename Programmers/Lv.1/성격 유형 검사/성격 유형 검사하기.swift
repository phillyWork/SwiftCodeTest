import Foundation

// R vs T
// C vs F
// J vs M
// A vs N

// choice
// --> 동의: 앞부분 점수 추가
// --> 비동의: 뒷부분 점수 추가

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    let types: [[String]] = [
        ["R", "T"],
        ["C", "F"],
        ["J", "M"],
        ["A", "N"]
    ]

    func setupDict() -> [String: Int] {
        var typeScoreDict = [String: Int]()
        for type in types {
            typeScoreDict[type[0]] = 0
            typeScoreDict[type[1]] = 0
        }
        return typeScoreDict
    }
    
    var typeScoreDict = setupDict()
    var result = ""
    
    zip(survey, choices).forEach { (types, choice) in
        let first = String(Array(types)[0])
        let second = String(Array(types)[1])
        typeScoreDict[choice < 4 ? first : second]! += abs(choice - 4)
    }
    
    for type in types {
        result.append(typeScoreDict[type[0]]! >= typeScoreDict[type[1]]! ? type[0] : type[1])
    }
    
    return result
}


// 개선
// type 데이터를 2차원 배열로 만들지 않기
// types를 reduce(into) 활용해 Dictionary로 구성하기
// inout 활용해 복사본 만들지 않고 효율 높이기

// reduce(into:_:)
// Returns the result of combining the elements of the sequence using the given closure
// This method is preferred over reduce(_:_:) for efficiency when the result is a copy-on-write type, for example an Array or a Dictionary

// 각 타입 기준에서 하나씩 선택 --> joined로 하나의 String으로 반환하기

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let types = ["RT", "CF", "JM", "AN"]
    var scores = types.reduce(into: [Character: Int]()) { dict, type in
            dict[type.first!] = 0
            dict[type.last!] = 0
    }

    zip(survey, choices).forEach { (type, choice) in
        let (disagree, agree) = (type.first!, type.last!)
        let score = abs(choice - 4)
        scores[choice < 4 ? disagree : agree, default: 0] += score
    }
    
    return types.map { scores[$0.first!]! >= scores[$0.last!]! ? String($0.first!) : String($0.last!) }.joined()
}
