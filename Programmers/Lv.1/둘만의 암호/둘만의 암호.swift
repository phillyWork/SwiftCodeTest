import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let skipSet = Set(skip)
    
    return s.map { char in
        var count = 0
        var asciiValue = char.asciiValue! // char의 ASCII 값을 변수에 저장
        
        while count < index {
            asciiValue += 1
            if asciiValue > 122 {   // 'z'를 넘어가면 'a'로 순환
                asciiValue = 97     // a: 97, z: 122
            }
            
            // skip 포함: 추가하지 않음
            if !skipSet.contains(Character(UnicodeScalar(asciiValue))) {
                count += 1
            }
        }
        return String(Character(UnicodeScalar(asciiValue)))
    }.joined()
}



func solution(_ s:String, _ skip:String, _ index:Int) -> String {

    // O(1) 조회 가능하도록 Set 생성
    let skipSet = Set(skip)
    
    // 알파벳 리스트
    let alphabet = (97...122).compactMap { UnicodeScalar($0) }.map { Character($0) }
    
    // 사용 가능한 문자 리스트 생성
    let availableChars = alphabet.filter { !skipSet.contains($0) }
    let charMap = Dictionary(uniqueKeysWithValues: availableChars.enumerated().map { ($1, $0) }) // (문자 -> 인덱스) 매핑
    
    return String(s.map { char -> Character in
        // 현재 문자의 인덱스 찾기
        guard let currentIndex = charMap[char] else { return char }
        // index만큼 이동 (z에서 다시 a로 이동하기)
        let newIndex = (currentIndex + index) % availableChars.count
        // 변환된 문자 반환
        return availableChars[newIndex]
    })
}



// 미리 skip 제외한 알파벳 문자열 만들기
// index만큼 각 s를 뒤로 이동하기

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let filtered = "abcdefghijklmnopqrstuvwxyz".filter { !skip.contains($0) }.map { $0 }
    let maps = filtered.enumerated().reduce(into: [:]) { dict, v in
        dict[v.element] = filtered[(v.offset+index) % filtered.count]
    }

    return s.map { String(maps[$0]!) }.joined()
}
