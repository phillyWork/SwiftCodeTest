import Foundation

// 주어진 numbers의 각 element들을 더해서 (본인끼리 더하기 제외) 
// 중복되는 결과값 없이 오름차순으로 정렬된 배열을 return하면 된다.

// bubble sort로 모든 element를 돌면서, 중복되는 결과값이 없애기 위해 Set을 활용한다.

func solution(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            result.insert(numbers[i]+numbers[j])
        }
    }
    return Array(result).sorted()
}

// Int Array 직접 활용 시, 포함 여부 따져서 추가

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int]()

    for i in 0 ..< numbers.count {
        for j in i+1..<numbers.count {
            let num = numbers[i] + numbers[j]
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result.sorted()
}
