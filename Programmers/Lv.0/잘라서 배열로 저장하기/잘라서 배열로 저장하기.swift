import Foundation

// 잘라서 저장
// 각 부분의 시작 위치 나타낼 indexArray 구성
// String은 Int로 subIndexing 불가한 점 --> 해결을 위해 개별 element를 모두 String type으로 변환
// 마지막 element는 길이 n보다 작아질 수 있는 점 고려하기 (딱 맞아 떨어지지 않을 수 있음)

func solution(_ my_str:String, _ n:Int) -> [String] {
    let strArr = my_str.map { String.init($0) }
    let startIndex = stride(from: 0, to: my_str.length, by: n)
    var result = [String]()

    for index in startIndex {
        if index+n >= my_str.length {
            result.append(strArr[index...my_str.length-1].joined())
        } else {
            result.append(strArr[index...index+n-1].joined())
        }
    }
    
    return result
}


// 개선
// 1. 굳이 String.init 위한 map 대신 바로 배열로 만들기
// 2. 마지막 값 계산을 if else로 처리하기 전에 min값으로 가져오기
// --> 마지막 부분 문자열 길이가 n보다 작을 수 있음 고려
// 3. 부분 문자열을 바로 String 초기화로 활용

func solution(_ my_str: String, _ n: Int) -> [String] {
    var result = [String]()
    let characters = Array(my_str)
    
    for i in stride(from: 0, to: characters.count, by: n) {
        let end = min(i + n, characters.count)
        result.append(String(characters[i..<end]))
    }
    
    return result
}
