import Foundation

// 각 문자열 길이 크기 순으로 정렬
// 가장 긴 문자열 element를 마지막 Index로 갖도록 하는 배열 생성
// 문자열 길이에 해당하는 Index의 element 추가하기
// 정렬 후 가장 큰 element를 반환하기

func solution(_ strArr:[String]) -> Int {
        
    let countArr = strArr.map { $0.count }.sorted(by: >)
    
    var countInIndex = Array(repeating: 0, count: countArr[0]+1)
    
    for count in countArr {
        countInIndex[count] += 1
    }

    return countInIndex.sorted(by: >)[0]
    
}


// 전제조건인 strArr가 최대 30개 주어짐을 활용
// 처음부터 배열 만들고 구성, 가장 큰 값 max로 반환하기

func solution(_ strArr:[String]) -> Int {
    var arr = Array(repeating: 0, count: 31)
    strArr.forEach { arr[$0.count] += 1 }
    return arr.max()!
}


// strArr 최대 개수의 배열에서 시작
// strArr 각 element의 길이만큼 해당 index의 +1하기
// 그 중 가장 큰 값을 반환

func solution(_ strArr:[String]) -> Int {
    strArr.reduce(into: Array(repeating: 0, count: 31)) { $0[$1.count] += 1}.max()!
}


// Dictionary grouping 생성자 활용
// strArr의 각 문자열 길이만큼 그룹 짓기
// 해당 그룹의 개수중 가장 큰 경우를 반환, 없을 경우 0 반환
 
func solution(_ strArr: [String]) -> Int {
    return Dictionary(grouping: strArr, by: { $0.count }).values.max(by: { $0.count < $1.count })?.count ?? 0
}
