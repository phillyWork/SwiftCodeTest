import Foundation

// components(separatedBy) 구현
// e.g.) 3x + 4 + 7x
// ["3x", "4", "7x"]

// 각 항이 x 포함하는지 여부로 따지기

// replacingOccurrences 활용
// x항에서 coefficient의 자릿수 알 수 없으므로 x를 제거한 형태의 String값을 Int로 변환하기
// 1x는 x로 나타나므로 replacingOccurrences 적용시 빈 문자열 --> Int 타입 변환 에러 --> ?? 활용해서 1 더하기

// 결과값
// 1x인 경우, 1x가 아닌 x로 나타내기

func solution(_ polynomial:String) -> String {
    
    var xNode = 0
    var origNum = 0

    polynomial.components(separatedBy: " + ").map {
        if $0.contains("x") {
            xNode += (Int(String($0.replacingOccurrences(of: "x", with: ""))) ?? 1)
        } else {
            origNum += (Int($0) ?? 0)
        }
    }
    
    if xNode == 0 { return "\(origNum)" }  // x 항이 없으면 숫자만 반환
    if origNum == 0 { return xNode == 1 ? "x" : "\(xNode)x" }  // 상수항이 없으면 x 항만 반환
    return xNode == 1 ? "x + \(origNum)" : "\(xNode)x + \(origNum)"  // 일반적인 경우
}
