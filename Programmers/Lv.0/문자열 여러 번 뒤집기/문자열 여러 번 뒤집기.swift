import Foundation

// s부터 e까지의 index를 기반으로 swapAt 활용

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var result = Array(my_string)
    
    queries.forEach {
        var left = $0[0]
        var right = $0[1]
        
        while left <= right {
            result.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    return String(result)
}

// replaceSubrange 활용
// s부터 e까지의 index를 반전된 부분 문자열로 대체하기

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var my_string = Array(my_string)
    queries.forEach {
        my_string.replaceSubrange($0[0]...$0[1], with: Array(my_string[$0[0]...$0[1]].reversed()))
    }
    return String(my_string)
}

// reverse로 직접 반전하기

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var myString = my_string.map { String($0) }
    queries.forEach { myString[$0[0]...$0[1]].reverse() }
    return myString.joined()
}
