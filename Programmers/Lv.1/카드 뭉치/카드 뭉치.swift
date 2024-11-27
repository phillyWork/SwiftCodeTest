import Foundation

// 두 배열과 목표 배열 비교해가며 한쪽이 끝날 때까지 반복문 실행
// 한 쪽이 끝났다면 남은 배열로 목표 배열과 계속해서 비교 수행

// 만약 목표 배열을 이미 끝까지 봤다면 (이미 완성되었다면)
// 성공으로 간주

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var cards1Index: Int = 0
    var cards2Index: Int = 0
    var goalIndex: Int = 0
    
    var isCards1AllUsed: Bool = false
    var isCards2AllUsed: Bool = false
    
    var result = "No"
    
    while (goalIndex < goal.count) {
        if cards1[cards1Index] == goal[goalIndex] {
            cards1Index += 1
            goalIndex += 1
            if cards1Index == cards1.count {
                isCards1AllUsed = true
                break
            }
        } else if cards2[cards2Index] == goal[goalIndex] {
            cards2Index += 1
            goalIndex += 1
            if cards2Index == cards2.count {
                isCards2AllUsed = true
                break
            }
        } else {
            return result
        }
    }
    
    if goalIndex == goal.count {
        return "Yes"
    }
    
    if isCards1AllUsed {
        for i in (cards2Index..<cards2.count) {
            if cards2[i] != goal[goalIndex] {
                return result
            }
            goalIndex += 1
            if goalIndex == goal.count {
                return "Yes"
            }
        }
        result = "Yes"
    } else if isCards2AllUsed {
        for i in (cards1Index..<cards1.count) {
            if cards1[i] != goal[goalIndex] {
                return result
            }
            goalIndex += 1
            if goalIndex == goal.count {
                return "Yes"
            }
        }
        result = "Yes"
    }
    
    return result
}


// 문제점: 코드가 너무 길고, index out of range 위험 존재 + 불필요한 변수
// 간결화: 목표 배열의 element를 가지고 직접 비교하기
// cards1이나 cards2에서 더 이상 비교할 것이 있는지 체크할 필요 없음

func solution(_ cards1: [String], _ cards2: [String], _ goal: [String]) -> String {
    var index1 = 0
    var index2 = 0
    
    for word in goal {
        if index1 < cards1.count && cards1[index1] == word {
            index1 += 1
        } else if index2 < cards2.count && cards2[index2] == word {
            index2 += 1
        } else {
            return "No"
        }
    }
    
    return "Yes"
}


// 좀 더 간결화: index 대신 첫번째 element로 비교하기
// 순서대로 활용해야 함: 각 배열의 첫번째 element가 goal과 모두 일치하지 않으면 생성 불가능
// 그 외: 생성 가능 --> 일치하는 element는 제거하기
// goal의 각 문자열 비교 끝날 때까지 진행, 끝까지 갔다면 최종 생성 가능

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var (ret, c1, c2) = ("Yes", cards1, cards2)
    goal.forEach {
        if c1.first == $0 { c1.removeFirst() }
        else if c2.first == $0 { c2.removeFirst() }
        else { ret = "No"}  // 이 시점부터 뒷 문자열의 비교는 무의미
    }
    return ret
}
