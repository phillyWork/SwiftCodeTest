import Foundation

// 회전해서 넣을 수 있으므로, 주어진 가로와 세로 길이는 고정된 것이 아니다.
// 주어진 각각의 가로와 세로 길이들에서 최대를 뽑아 넓이를 구해야 하므로 
// 2차원 배열에 각 element마다 길이들을 받으면 더 긴 길이를 가로로 설정, 나머지를 세로로 설정한다.
// 그 후, 가로들에서 최대값을, 세로들에서 최대값을 뽑아 그 넓이를 구하면 된다.

// complexity: O(n^2)
// append: Int type 배열을 매번 사이즈 조정 후, element 추가: O(n)
// 각 element마다 append: O(n)

func solution(_ sizes:[[Int]]) -> Int {
    var longer = [Int]()
    var shorter = [Int]()
    
    for size in sizes {
        if size[0] >= size[1] {
            longer.append(size[0])
            shorter.append(size[1])
        } else {
            longer.append(size[1])
            shorter.append(size[0])
        }
    }
    
    return longer.max()! * shorter.max()!
}

// 2차원 배열의 각 element, 1차원 배열을 볼 때마다 값을 비교한다.
// 0번째가 1번째보다 작다면 max비교에 [1]을 할당, min비교에 [0]을 할당한다.
// 이전까지의 max와 min을 비교해서 새로운 max와 min을 구한다.

// complexity: O(n)

func solution(_ sizes:[[Int]]) -> Int {
    var maxLength = 0
    var minLength = 0

    for size in sizes {
        if size[0] < size[1] {
            maxLength = max(maxLength, size[1])
            minLength = max(minLength, size[0])
        }
        else {
            maxLength = max(maxLength, size[0])
            minLength = max(minLength, size[1])
        }
    }
    
    return maxLength * minLength
}
