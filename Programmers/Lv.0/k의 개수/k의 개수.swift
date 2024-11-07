import Foundation

// 자릿수 숫자 비교하기
// 단순 포함 여부 뿐만 아니라 각 수마다 해당 숫자를 몇개 포함하는 지를 다 더해야 하므로 각 자릿수 비교를 따지면 다음과 같다.

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    return (i...j).map { number in
        var count = 0
        var num = number
        while num > 0 {
            if num % 10 == k { count += 1 }
            num /= 10
        }
        return count
    }.reduce(0, +)
}

// 직접 각 자릿수 비교하기
// 각 수를 String으로 형변환해서 내부의 각 자릿수를 String 타입으로 비교하면 count로 올바른 개수를 셀 수 있다.

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    return (i...j).map { String($0).filter { String($0) == String(k) }.count }.reduce(0, +)
}
