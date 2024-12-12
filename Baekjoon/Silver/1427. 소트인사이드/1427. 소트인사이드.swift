import Foundation

// 1. 입력값을 배열로 구성 (각 자리수를 element로 취급하기)
// 2. 각 element 형변환 (Character --> String --> Int)
// 3. 내림차순 정렬
// 4. String으로 형변환
// 5. joined()로 하나의 문자열 만들기

print(Array(readLine()!).map { Int(String($0))! }.sorted { $0 > $1 }.map { String($0) }.joined())


// 최적화
// 굳이 Int 타입으로 형변환하지 않더라도 String 타입에서도 내림차순 정렬 가능

print(String(readLine()!.sorted(by: >)))
