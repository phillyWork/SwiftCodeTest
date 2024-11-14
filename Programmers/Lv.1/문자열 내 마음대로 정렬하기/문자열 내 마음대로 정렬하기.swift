import Foundation

// strings의 각 element의 해당 문자를 비교해서 sort
// 직접적으로 Int 타입을 통한 subscript를 활용해 해당 element를 찾을 수 없으므로, Index를 활용해서 구하려면 String.Index가 필수
// String 타입의 element를 [String]으로 변환해서 활용하면 각 문자는 Int 타입으로 subscript 접근이 가능


func solution(_ t:String, _ p:String) -> Int {
    //기본: 문자 기준 오름차순 정렬하기
    //같은 문자인 경우: 원본으로 비교, 오름차순 정렬
    return strings.sorted { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] }
}



// 오류 사고 과정

// 1. strings에서 각 element의 n번째 문자 뽑아서 배열로 저장
// 2. enumerated를 별도로 저장해 해당 문자가 포함된 원본의 index 기억하기
// 3. sorted된 배열을 별도로 저장
// 4. sorted된 배열의 각 문자를 enumerated의 offset을 찾아서 strings의 index로 활용, 빈 배열에 해당 문자열을 추가한다.

//문제점: 동일한 문자가 뽑힌 경우, 원본 문자열로 비교해야 하는데 이러면 조건문이 다시 추가되고 메모리 오류가 발생했다.
