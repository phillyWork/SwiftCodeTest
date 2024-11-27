import Foundation

// 나머지가 7인지 여부 확인, reduce로 7의 개수 최종합 구하기

func solution(_ array:[Int]) -> Int {
    return array.reduce(0) { sum, num in
        var count = 0
        var n = num
        while n > 0 {
            if n % 10 == 7 { count += 1 }
            n /= 10
        }
        return sum + count
    }
}


// String으로 형변환, joined로 모든 숫자 문자열 더하기
// 해당 문자열을 Array로 만들어서 각각 한자리 수 문자열로 만들기
// "7"과 일치 여부 filter

// e.g.) [1, 3, 7, 71, 57]
// ["1", "3", "7", "71", "57"]
// "1377157"
// ["1", "3", "7", "7", "1", "5", "7"]
// ["7", "7", "7"]
// 3

func solution(_ array: [Int]) -> Int {
    return Array(array.map(String.init).joined()).filter { $0 == "7" }.count
}
