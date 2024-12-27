import Foundation

// 단순 날짜 정수로 비교하기

func solution(_ date1:[Int], _ date2:[Int]) -> Int {
    var result = 0
    
    for (d1, d2) in zip(date1, date2) {
        if d1 == d2 {
            continue
        } else if d1 > d2 {
            result = 0
            break
        } else {
            result = 1
            break
        }
    }
    
    return result
}

// 직접 연도, 월, 일로 000000 구성하기

func solution(_ date1: [Int], _ date2: [Int]) -> Int {
    return date1[0] * 10000 + date1[1] * 100 + date1[2] < date2[0] * 10000 + date2[1] * 100 + date2[2] ? 1 : 0
}



// Date 타입으로 비교하기

// DateComponents 활용

// Calendar 활용 Date로 타입 변경, 날짜 구성하기

func solution(_ date1: [Int], _ date2: [Int]) -> Int {
    // 날짜 배열을 DateComponents로 변환
    let calendar = Calendar.current
    let date1Components = DateComponents(year: date1[0], month: date1[1], day: date1[2])
    let date2Components = DateComponents(year: date2[0], month: date2[1], day: date2[2])
    
    // DateComponents를 Date로 변환
    guard let d1 = calendar.date(from: date1Components),
          let d2 = calendar.date(from: date2Components) else {
        return 0 // 날짜 변환 실패 시 기본값 반환
    }
    
    // 날짜 비교
    return d1 < d2 ? 1 : 0
}
