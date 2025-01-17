import Foundation

// spell의 모든 element가 다 포함되어야 함

func solution(_ spell:[String], _ dic:[String]) -> Int {
    return dic.filter { word in
                for c in spell {
                    if !word.contains(c) {
                        return false
                    }
                }
                return true
            }.isEmpty ? 2 : 1
}



// 개선점: 굳이 모든 element를 비교하지 않기

// dic의 각 단어들을 spell과 동일하게 sort
// 그 후, spell의 element들을 합친 String이 dic에 포함되어 있다면 1, 아니면 2

func solution(_ spell: [String], _ dic: [String]) -> Int {
    return dic.map { String($0.sorted()) }
        .contains(spell.sorted().joined()) ? 1 : 2
}
