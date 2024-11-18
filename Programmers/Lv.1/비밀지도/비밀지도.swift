import Foundation

// 출제 해설
// 비트 연산(Bitwise Operation)을 묻는 문제입니다.
// 이미 문제 예시에 2진수로 처리하는 힌트가 포함되어 있고, 둘 중 하나가 1일 경우에 벽 #이 생기기 때문에 OR로 처리하면 간단히 풀 수 있습니다.
// 아주 쉬운 문제였던 만큼 if else로 풀이한 분들도 많이 발견되었는데요.
// 정답으로는 간주되지만 이 문제는 비트 연산을 잘 다룰 수 있는지를 묻고자 하는 의도였던 만큼 앞으로 이런 유형의 문제를 풀 때는 비트 연산을 꼭 기억하시기 바랍니다.


// arr1과 arr2의 정수값을 이진수로 표현한 값의 각 자리수를 OR 연산한 결과값을 " "와 "#"로 나타낸다.
// 각 자리수를 구하려면 2로 나눈 나머지 (%2) 값을 활용한다.

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in 0..<n {
        var num1 = arr1[i]
        var num2 = arr2[i]
        var result = [Character]()
        for _ in 1...n {
            (num1%2 | num2%2) == 1 ? result.insert("#", at: 0) : result.insert(" ", at: 0)
            num1 /= 2
            num2 /= 2
        }
        answer.append(String(result))
    }
    return answer
}


// map, radix, << 활용

// 2진법 계산을 위해 radix를 활용

// String init(_:radix:)
// Creates a new integer value from the given string and radix.

// 1. 0부터 n-1까지 따져가며
// 2. arr1과 arr2의 각 Int 타입의 element를 2진법으로 나타낸다. (1부터 n)
// 3. arr1과 arr2의 element의 각 자리 숫자로 bitwise OR 계산을 한다.
// (각 자리수 계산을 위해 left shift operator '<<' 를 활용한다.)
// 4. 결과값을 String으로 변환, map함수를 활용, "1"인 경우 "#"로, 아니면 " "로 나타낸다.
// 5. Character 결과값을 String으로 변환해서 return한다.

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map {
            $0 == "1" ? "#" : " " }[1...n])
    }
}
