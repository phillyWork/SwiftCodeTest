import Foundation

// 신고한 유저 --> 신고당한 유저
// 신고당한 횟수 기준점 초과: 해당 유저를 신고한 모든 유저에게 결과 메일 보내기

// Dictionary 활용, id_list에서 모든 유저 명단을 알 수 있으므로 강제 언래핑(!)을 활용

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 유저: 신고당한 횟수
    var reportedCount: [String: Int] = [:]
    
    // 신고당한 유저: 신고한 유저
    // Set으로 동일한 유저의 중복 신고 제거하기
    var userReport: [String: Set<String>] = [:]
    
    // 신고한 유저: 결과 메일 개수
    var reportMailCount: [String: Int] = [:]
    
    id_list.forEach {
        reportedCount[$0] = 0
        userReport[$0] = Set<String>()
        reportMailCount[$0] = 0
    }
    
    report.forEach {
        let reportReportedUser = $0.split(separator: " ")
        if !(userReport[String(reportReportedUser[1])]!.contains(String(reportReportedUser[0]))) {
            reportedCount[String(reportReportedUser[1])]! += 1
            userReport[String(reportReportedUser[1])]!.insert(String(reportReportedUser[0]))
        }
    }
    
    for (user, count) in reportedCount {
        if count >= k {
            userReport[user]!.forEach { reportMailCount[$0]! += 1 }
        }
    }
    
    return id_list.map { reportMailCount[$0]! }
}



// 개선점

// 하나의 유저가 동일한 유저 반복 신고 가능 --> 결과적으로 1회 처리
// 굳이 동일한 element를 고려할 필요 없음
// report는 Set으로 타입 변경, 반복되는 element 제거

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 신고 당한 유저: 신고 당한 횟수
    var reported: [String: Int] = [:]
    // 신고 한 유저: 신고 당한 유저들
    var user: [String: [String]] = [:]

    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        // 신고 한 여부 확인
        return (user[id] ?? []).reduce(0) {
            // 해당 유저에게 신고당한 각 유저의 신고 당한 횟수 확인
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}
