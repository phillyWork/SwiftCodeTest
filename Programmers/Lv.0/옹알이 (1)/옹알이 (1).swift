import Foundation

// replacingOccurrences(of: with:) 활용, 대치하기

// Int로 형변환이 된다면 해당 element가 온전하게 발음할 수 있는 단어들로 구성되어 있음 의미

// 전제: 한 단어에서 발음할 수 있는 단어 요소는 최대 1번만 발생 (중복해서 나타나지 않음)

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    
    var temp = [String]()
    var count = 0
    
    for sound in babbling {
        var replacement = sound
        .replacingOccurrences(of: words[0], with: "1")
        .replacingOccurrences(of: words[1], with: "2")
        .replacingOccurrences(of: words[2], with: "3")
        .replacingOccurrences(of: words[3], with: "4")
        
        temp.append(replacement)
    }
    
    for repl in temp {
        if let intRepl = Int(repl) {
            count += 1
        }
    }
    
    return count
}


// 고도화: 각 element마다 발음할 수 있는 단어 요소가 존재하면 빈문자열로 대체
// 완전하게 대체되면 비어있는 문자열이 될 것이므로 최종 결과값이 빈 분자열인 element만 남기도록 filter
// filter로 남은 element 개수 세기

func solution(_ babbling:[String]) -> Int {
    return babbling.filter { word in
        var temp = word
        ["woo", "ye", "ma", "aya"].forEach { temp = temp.replacingOccurrences(of: $0, with: "") }
        return temp.isEmpty
    }.count
}
