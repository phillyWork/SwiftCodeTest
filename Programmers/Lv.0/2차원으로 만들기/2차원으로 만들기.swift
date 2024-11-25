import Foundation

// 단순 1차원 배열 element 생성 뒤, 조건 만족 시 2차원 배열에 추가하기

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {

    var result = [[Int]]()
    var temp = [Int]()
    
    for num in num_list {
        temp.append(num)
        if temp.count == n {
            result.append(temp)
            temp.removeAll()
        }
    }
    
    return result
}


// stride 활용: 개별 1차원 element의 시작 index로만 구성된 배열 구성

// map: 각 시작 index에서 n개만큼 1차원 배열 구성, element로 만들기

func solution(_ num_list: [Int], _ n: Int) -> [[Int]] {
    return stride(from: 0, to: num_list.count, by: n).map { i in
        Array(num_list[i..<i+n])
    }
}
