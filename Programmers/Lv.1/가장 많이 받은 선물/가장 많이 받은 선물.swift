import Foundation

// 두 사람 주고 받은 기록 존재
// --> 주고 받은 횟수 비교
// --> 차이 존재: 더 큰 사람이 다음에 받기

// --> 동일한 경우
// + 두 사람 주고 받은 기록 없음
// ==> 개개인의 선물 횟수 비교
// ==> 차이 존재: 더 작은 사람이 다음에 받기
// ==> 동일: 주고 받기 없음


struct GiftHistory: Hashable {
    let from: String
    let to: String
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var eachOneGiftCount = [String: (Int, Int)]()
    var giftHistoryList = [GiftHistory: Int]()
    var nextMonthGiftCount = [String: Int]()
    
    for friend in friends {
        nextMonthGiftCount[friend] = 0
        eachOneGiftCount[friend] = (0, 0) // (준 선물, 받은 선물)
    }
    
    for gift in gifts {
        let giftEach = gift.split(separator: " ").map { String($0) }
        let sender = giftEach[0], receiver = giftEach[1]
        let giftKey = GiftHistory(from: sender, to: receiver)
        
        giftHistoryList[giftKey, default: 0] += 1
        eachOneGiftCount[sender] = (eachOneGiftCount[sender]!.0 + 1, eachOneGiftCount[sender]!.1)
        eachOneGiftCount[receiver]!.1 += 1
    }
    
    for i in 0..<friends.count - 1 {
        for j in i+1..<friends.count {
            let fromIToJ = giftHistoryList[GiftHistory(from: friends[i], to: friends[j])] ?? 0
            let fromJToI = giftHistoryList[GiftHistory(from: friends[j], to: friends[i])] ?? 0
            
            let iHistory = eachOneGiftCount[friends[i]]!
            let jHistory = eachOneGiftCount[friends[j]]!
            let iGiftScore = iHistory.0 - iHistory.1
            let jGiftScore = jHistory.0 - jHistory.1
            
            if fromIToJ > fromJToI {
                nextMonthGiftCount[friends[i]]! += 1
            } else if fromIToJ < fromJToI {
                nextMonthGiftCount[friends[j]]! += 1
            } else {
                if iGiftScore > jGiftScore {
                    nextMonthGiftCount[friends[i]]! += 1
                } else if iGiftScore < jGiftScore {
                    nextMonthGiftCount[friends[j]]! += 1
                }
            }
        }
    }
    
    return nextMonthGiftCount.values.max() ?? 0
}
