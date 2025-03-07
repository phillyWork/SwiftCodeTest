import Foundation

// 약관 종류에 따른 유효기간 Dictionary로 보관
// 개별 약관 종류에 따라 수집 일자 + 유효기간으로 파기 만료 기간을 계산
// 오늘 날짜와 비교해서 처리

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result = [Int]()
    var termDict = [String: Int]()
    
    for term in terms {
        let termCase = term.split(separator: " ").map { String($0) }
        termDict[termCase[0]] = Int(termCase[1])!
    }
    
    for i in 0..<privacies.count {
        let privacyCase = privacies[i].split(separator: " ").map { String($0) }
       
        if let termLength = termDict[privacyCase[1]] {
            let todayDate = today.split(separator: ".").map { Int($0)! }
            var expDueDate = privacyCase[0].split(separator: ".").map { Int($0)! }
            
            // 유효기간을 더한 후 하루 빼기 (28일 고정된 달력 기준)
            expDueDate[1] += termLength
            while expDueDate[1] > 12 {
                expDueDate[1] -= 12
                expDueDate[0] += 1
            }
            expDueDate[2] -= 1
            
            // 만약 일이 0일이면, 한 달 전으로 변경
            if expDueDate[2] == 0 {
                expDueDate[1] -= 1
                expDueDate[2] = 28
                if expDueDate[1] == 0 {
                    expDueDate[1] = 12
                    expDueDate[0] -= 1
                }
            }
            
            if (todayDate[0] > expDueDate[0]) ||
            (todayDate[0] == expDueDate[0] && todayDate[1] > expDueDate[1]) ||
            (todayDate[0] == expDueDate[0] && todayDate[1] == expDueDate[1] && todayDate[2] > expDueDate[2]) {
                result.append(i+1)
            }
        }
    }
    
    return result
}


// 날짜 데이터를 Int 배열로 하나씩 비교보다 Date 타입으로 비교하기

func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var result = [Int]()
    var termDict = [String: Int]()
    
    // 날짜 변환을 위한 DateFormatter
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    dateFormatter.timeZone = TimeZone(identifier: "UTC") // UTC 기준

    // 오늘 날짜를 Date로 변환
    guard let todayDate = dateFormatter.date(from: today) else { return [] }

    // 약관 정보를 Dictionary 형태로 저장
    for term in terms {
        let termData = term.split(separator: " ")
        termDict[String(termData[0])] = Int(termData[1])!
    }
    
    for i in 0..<privacies.count {
        let privacyData = privacies[i].split(separator: " ")
        guard let collectedDate = dateFormatter.date(from: String(privacyData[0])),
              let termMonths = termDict[String(privacyData[1])] else { continue }
        
        // 유효기간 계산 (수집일 + termMonths 개월 - 1일)
        if let expiryDate = Calendar.current.date(byAdding: .month, value: termMonths, to: collectedDate),
           let finalExpiryDate = Calendar.current.date(byAdding: .day, value: -1, to: expiryDate) {
            
            // 오늘 날짜와 비교하여 파기해야 하면 결과에 추가
            if todayDate >= finalExpiryDate {
                result.append(i + 1)
            }
        }
    }
    
    return result
}
