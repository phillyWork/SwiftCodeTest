import Foundation

// dictionary 활용

func solution(_ before:String, _ after:String) -> Int {
    
    var dict = [String: Int]()
    
    for str in before {
        if dict[String(str)] != nil {
            dict[String(str)]! += 1
        } else {
            dict[String(str)] = 1
        }
    }
    
    for str in after {
        if dict[String(str)] != nil {
            if dict[String(str)]! <= 0 {
               return 0;
            } else {
                dict[String(str)]! -= 1
            }
        } else {
            return 0;
        }
    }
    
    return 1
}


// 간단 처리: sorted 활용

func solution(_ before:String, _ after:String) -> Int {
    return before.sorted() == after.sorted() ? 1 : 0
}
