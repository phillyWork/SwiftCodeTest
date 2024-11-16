import Foundation

// 1) i번째 ~ j번째까지의 array의 element를 임시 배열에 저장한다.
// 2) 임시 배열을 정렬
// 3) 임시 배열의 k번째 element를 결과로 얻는다.

// 2차원 배열 commands에서 각 command마다 하나의 element를 구할 수 있다.
// 따라서 결과 배열을 생성하고, 하나의 element를 구할 때마다 결과 배열에 추가한다.

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result = [Int]()
    
    for command in commands {
        var selectedArray = [Int]()
        for index in command[0]-1...command[1]-1 {
            selectedArray.append(array[index])
        }
        result.append(selectedArray.sorted()[command[2]-1])
    }

    return result
}

// 정돈된 배열 활용
// closure에서 $0은 2차원 배열 commands의 각 command, 1차원 배열을 의미한다.

// 1) commands의 각 command에 대하여 ($0)
// 2) i, j, k값을 변수로 저장
// 3) array의 i번째부터 j번째까지를 뽑고, 정렬을 한 뒤, k번째 element를 반환
// 4) 반환된 element를 command를 대신하여 commands에 저장 (map)
// 5) 변환된 commands를 반환

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map {
        let i = $0[0]-1
        let j = $0[1]-1
        let k = $0[2]-1
        return array[i...j].sorted()[k]
    }
}
