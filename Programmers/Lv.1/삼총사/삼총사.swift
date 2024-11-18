import Foundation

// 단순 해결: 삼중 반복문

// 찾아야 하는 수는 3개이며, 중복된 결과값을 포함하지 않으므로, 시작점 i를 기준으로 그 다음 위치인 j, j 바로 다음 위치인 k를 활용해서 조건에 맞으면 개수를 추가한다.

// 다만 반복문이 두 번 이상으로 중첩되면 시간복잡도로 O(n^2) 그 이상을 경험할 수 있기에 바람직해보이지는 않는다.

func solution(_ number:[Int]) -> Int {
    var result = 0
    for i in 0..<number.count {
        for j in i+1..<number.count {
            for k in j+1..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }
    return result
}


// DFS

// 찾아야 하는 결과값들은 다음 과정으로 분리해서 볼 수 있다.

// 1. 찾아야 하는 숫자 개수가 3개여야 한다.
// (찾아야 하는 숫자가 3개가 될 때까지 반복해서 찾는다.)
// 2. 찾은 숫자들의 합이 0이 되어야 한다.

func solution(_ number:[Int]) -> Int {
    var answer = 0
    
    func dfs(_ index: Int, _ sum: Int, _ count: Int) {
        if count == 3 {
            if sum == 0 {
                answer += 1
            }
            return
        }
        // 3개가 아니라면 3개가 될 때까지 현재 위치에서 찾을 수 있는 모든 조합을 반복문으로 찾음
        for i in index..<number.count {
            dfs(i+1, sum+number[i], count+1)
        }
    }
    
    dfs(0, 0, 0)
    
    return answer
}
