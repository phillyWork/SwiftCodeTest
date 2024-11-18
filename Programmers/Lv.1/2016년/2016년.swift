import Foundation

// 1월 1일부터 a월 b일까지의 날짜를 더해서 나머지로 날짜 구분하기

// 일주일은 7일을 기준으로 반복되므로 7로 나눈 나머지의 값에 따라 해당하는 요일을 구할 수 있다.
// 제한 사항의 윤년이 있으므로 2월은 29일임을 고려해야한다.

func solution(_ a:Int, _ b:Int) -> String {
    var days = 0
    for month in 1..<a {
        if month == 2 {
            days += 29
        } else {
        // 8월 이전 홀수월은 31일, 짝수월은 30일
        // 8월 이후 홀수월은 30일, 짝수월은 31일
            if (month%2 == 0 && month<8) || (month%2 != 0 && month>=8) {
                days += 30
            } else {
                days += 31
            }
        }
    }
    days += b-1
    switch days%7 {
        case 0: return "FRI"
        case 1: return "SAT"
        case 2: return "SUN"
        case 3: return "MON"
        case 4: return "TUE"
        case 5: return "WED"
        case 6: return "THU"
        default: return ""
    }
}


// 각 달에 해당하는 날짜 배열을 활용, Index가 해당 월 역할하도록 하기

// 요일 이름을 담은 배열과 각 달의 날 수를 배열을 새로 정의
// a월 이전까지의 날짜 합 및 a월 b일 까지의 b를 더한 뒤, 7로 나눈 나머지로 요일을 구한다.

func solution(_ a:Int, _ b:Int) -> String {
    let weekdays = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    let daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return weekdays[(daysInMonth[0..<a-1].reduce(0, +) + b - 1) % 7]
}


// DateFormatter 활용, 직접 날짜 구하기

func solution(_ a:Int, _ b:Int) -> String {
    let dateToGet = DateFormatter()
    dateToGet.dateFormat = "yyyy-MM-dd"
    let date = dateToGet.date(from:"2016-\(a)-\(b)")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE"        // "EE" to get short style
    return dateFormatter.string(from:date!).uppercased()
}
