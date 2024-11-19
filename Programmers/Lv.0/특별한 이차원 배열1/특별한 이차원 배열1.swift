import Foundation

// 2차원 배열 생성
// enumerated 활용, 해당 index에 위치한 1차원 배열의 index의 element를 1로 변환

func solution(_ n:Int) -> [[Int]] {
    var array = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    return array.enumerated()
    .map { (index, element) in
          array[index][index] = 1
          return array[index]
         }
}


// enumerated 없이 forEach로 index 직접 구성

func solution(_ n:Int) -> [[Int]] {
    var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    (0..<n).forEach { arr[$0][$0] = 1 }
    return arr
}


// 0부터 n-1까지의 sequence 구성
// 각 element마다 다시 sequence 구성
// 각 element의 index와 해당 element 마다의 sequence 내 index 동일할 때만 1 할당

func solution(_ n:Int) -> [[Int]] {
    return (0..<n).map { i in (0..<n).map { j in i == j ? 1 : 0 } }
}


