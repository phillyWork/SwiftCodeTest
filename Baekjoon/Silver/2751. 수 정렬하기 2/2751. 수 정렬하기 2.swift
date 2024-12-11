import Foundation

// 따로 함수 없이 입력값 직접 받아서 처리하는 경우
// Command Line 입력 처리하듯이 받기

// readLine(): 문자열로 한 줄(\n) 입력값 받기

// 이 문제에서는 값 하나이므로 바로 정수형으로 형변환처리

// 여러 값 입력: readLine()!.split(separator: " ").map { // 필요한 처리 }

let arrayLength = Int(readLine()!)!
var array = [Int]()

for _ in 0..<arrayLength {
    let input = Int(readLine()!)!
    array.append(input)
}

array.sort(by: <)

// array.forEach { print($0) }
for num in array {
    print(num)
}


