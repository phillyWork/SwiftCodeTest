import Foundation

// 에러 원인
// 1. filter 활용 --> 내부적 contains 실행 --> O(n) 반복 활용
// 2. 큰 자리수 --> Int 변환 시 오류 가능

func solutionError(_ X:String, _ Y:String) -> String {
    let xCommon = X.filter { Y.contains($0) }
    let yCommon = Y.filter { X.contains($0) }
    let minCommon = xCommon.count >= yCommon.count ? yCommon : xCommon
    let result = minCommon.sorted(by: >).map { String($0) }.joined()

    guard let intResult = Int(result) else { return "-1" }
    return String(intResult)
}


// 해결
// 큰 자릿수 해결: 각 숫자에 대한 횟수를 카운팅하도록 하기 ~ Int로 형변환 피하기

func solution(_ X:String, _ Y:String) -> String {
    var xCount = Array(repeating: 0, count: 10)
    var yCount = Array(repeating: 0, count: 10)

    // 숫자 개수 카운팅
    for ch in X { xCount[Int(String(ch))!] += 1 }
    for ch in Y { yCount[Int(String(ch))!] += 1 }

    var result = ""

    // 큰 숫자부터 결과에 추가
    for i in stride(from: 9, through: 0, by: -1) {
        let minCount = min(xCount[i], yCount[i]) // 짝지을 수 있는 개수만 사용
        result += String(repeating: String(i), count: minCount)
    }

    if result.isEmpty { return "-1" }  // 공통 숫자가 없는 경우
    if result.first == "0" { return "0" } // 0으로만 이루어진 경우

    return result
}



// 교집합 활용해서 카운트 작업 따로 할 필요 없이 하기

func solution(_ X:String, _ Y:String) -> String {
    let arr1 = Array(X)
    let arr2 = Array(Y)
    let uniqueKey = Set(arr1).intersection(Set(arr2))
    var answer = ""
    for key in uniqueKey.sorted(by: >) {
        answer += String(repeating: key, count: min(arr1.filter{$0 == key}.count, arr2.filter{$0 == key}.count))
    }
    return answer == "" ? "-1" : ((uniqueKey.count == 1 && uniqueKey.contains("0")) ? "0" : answer)
}
