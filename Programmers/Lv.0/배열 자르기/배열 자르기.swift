import Foundation

// 배열 offset(index)와 element(value) 활용하기
// enumerated 작업 뒤, 배열의 index로 filter 하고나면, map으로 해당 index의 value로 배열을 재구성

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return numbers.enumerated().filter { $0.offset >= num1 && $0.offset <= num2 }.map { $0.element }
}

// stride 활용
// index 범위 stride로 구해서 배열에서 element 가져오기

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return stride(from: num1, to: num2, by: 1).map { numbers[$0] }
}

// 배열 속성 활용
// num1부터 num2까지의 sequence를 numbers의 index로 활용해 배열로 재구성

func solution1(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return (num1...num2).map { numbers[$0] }
}

// sequence를 넘겨받아 배열 초기화로 새로 생성
// numbers의 num1부터 num2까지의 index에 해당하는 element들의 sequence를 배열로 만들기

func solution2(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return Array(numbers[num1...num2])
}
