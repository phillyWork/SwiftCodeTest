import Foundation

// 배열 element 제거 및 추가하기

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var result = numbers
    direction == "right" ? result.insert(result.removeLast(), at: 0) : result.append(result.removeFirst())
    return result
}

// Index 변화 주기
// 오른쪽으로 이동: 현재 index + 1을 하고, 맨 마지막 element의 경우, 0으로 돌아와야 하므로 새로운 index를 다음과 같이 표현
// newIndex = (index + 1) % numbers.count
// 왼쪽으로 이동: 현재 index - 1을 하고, 원래의 0번째 element는 n-1번째로 돌아가야 하므로 새로운 index를 다음과 같이 표현
// newIndex = (index - 1 + numbers.count) % numbers.count

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    return (0..<numbers.count).map { numbers[(direction == "right" ? $0+1 : $0-1+numbers.count) % numbers.count] }
}
