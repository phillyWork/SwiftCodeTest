import Foundation

// 반복 사이클 고려

// n번째 이후의 element들은 밀려서 앞으로 당겨진다는 의미를 고려

// index: 0..<count

// index 0: num_list[0] --> new[2]: 5 - 3 + 0
// index 1: num_list[1] --> new[3]: 5 - 3 + 1
// index 2: num_list[2] --> new[4]: 5 - 3 + 2

// index 3: num_list[3] --> new[0]: 3 - 3
// index 4: num_list[4] --> new[1]: 4 - 3

// 규칙에 의해 밀려날 element들은 num_list 배열의 크기를 빌려와 새로운 자리를 찾는다.

// index < n ? new[count - n + index] = num_list[index] : new[index - n] = num_list[index]


// 나머지 고려
// n을 기점으로 밀리고 옮기는 작업을 배열 크기 내에서 반복되는 사이클이라고 보면, 결국 index는 나머지 값이 얼마인지에 따라 결정되는 개념과 동일함을 알 수 있다.

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    var temp = Array(0..<num_list.count)
    for index in temp {
        if index < n {
            temp[num_list.count - n + index] = num_list[index]
        } else {
            temp[index - n] = num_list[index]
        }
    }
    return temp
}


// 기점이 되는 n을 직접 받으므로, 다른 계산 없이 바로 부분배열을 구해서 새로운 배열로 만드는 작업도 가능하다.

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    // 1. num_list가 2번 반복되는 배열 생성 후, n부터 n+count-1 까지 element만 추출: count
    // 0...count-1 중 n...count-1: count-n
    // count...count*2-1 중 count...n+count-1: n
    return Array((num_list + num_list)[n..<n + num_list.count])
    
    // 2. 문제 그대로 n부터 시작하는 부분 배열과 n 이전까지의 부분 배열 조합
    return (Array(num_list[n...] + Array(num_list[..<n]))).flatMap { $0 }
}
