import Foundation

// 아메리카노, 카페라떼의 종류가 어떤지 중요하지 않음
// 아메리카노, 카페라떼 종류에 포함되는지 여부가 중요

func solution(_ order:[String]) -> Int {
    
    let americano: Set<String> = ["iceamericano", "americanoice", "hotamericano", "americanohot", "americano", "anything"]
    let cafelatte: Set<String> = ["icecafelatte", "cafelatteice", "hotcafelatte", "cafelattehot", "cafelatte"]
    
    return order.reduce(0) { sum, current in
        return americano.contains(current) ? sum + 4500 : sum + 5000
    }
    
}


// 개선
// 따로 Set 만들 필요도 없이 "cafelatte" 문자열이 부분으로 포함되어있는지만 따지기
// anything (아무거나)도 americano로 처리하기 때문

func solution(_ order: [String]) -> Int {
    return order.map { $0.contains("cafelatte") ? 5000 : 4500 }.reduce(0, +)
}
