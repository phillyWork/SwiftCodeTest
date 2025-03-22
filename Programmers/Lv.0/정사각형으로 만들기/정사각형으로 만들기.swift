import Foundation

// 개수 비교

func solution(_ arr:[[Int]]) -> [[Int]] {
    
    var result = arr
    
    if arr.count > arr[0].count {
        for i in 0..<arr.count {
            result[i].append(contentsOf: Array(repeating: 0, count: arr.count - arr[0].count))
        }
        return result
    } else if arr.count < arr[0].count {
        while result.count < arr[0].count {
            result.append(Array(repeating: 0, count: arr[0].count))
        }
        return result
    } else {
        return arr
    }
}

// 굳이 if-else로 구분할 필요 X
// 동일하면 어차피 0개만큼 추가할 것이기에 차이 없음

func solution(_ arr:[[Int]]) -> [[Int]] {
    var arr = arr
    if arr.count > arr[0].count {
        for i in 0..<arr.count {
            arr[i] += Array(repeating: 0, count: arr.count - arr[i].count)
        }
    } else {
        arr.append(contentsOf: Array(repeating: Array(repeating: 0, count: arr[0].count), count: arr[0].count - arr.count))
    }
    return arr
}

// 목적: 빈 부분을 0으로 채우기
// 미리 더 큰 사이즈만큼의 배열을 구성, element 모두 0
// 실제 값 있는 위치: 원본 배열의 element 위치값 활용해서 넣기

func solution(_ arr:[[Int]]) -> [[Int]] {
    var size = max(arr.count, arr[0].count)
    var array = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)

    for i in arr.indices {
        array[i][0..<arr[i].count] = arr[i][0..<arr[i].count]
    }
    return array
}
