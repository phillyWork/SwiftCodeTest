import Foundation

// binary한 한 쪽 구해서 복사하기
// 두 선수 공평하게 시작하기 위해 동일한 음식을 받는 것은 String에서 양 극단부터 가운데 위치까지 동일한 element를 가진다는 것을 의미한다.
// 음식 개수가 홀수인 경우, 나머지는 활용하지 못하므로, 각 선수가 얻을 수 있는 음식 개수는 food[i] / 2 로 구성할 수 있다.
// 따라서 한 쪽 선수의 문자열을 구한 뒤, 가운데 0 및 역순된 문자열을 구하면 될 것이다.

func solution(_ food:[Int]) -> String {
    var str = ""
    for i in 1..<food.count {
        str += String(repeating: String(i), count: food[i]/2)
    }
    return str + "0" + str.reversed()
}

// enumerated로 index 한번에 적용

func solution(_ food:[Int]) -> String {
    let str = food.enumerated().map { String(repeating: String($0.offset), count: $0.element/2) }.joined()
    return "\(str)0\(String(str.reversed()))"
}
