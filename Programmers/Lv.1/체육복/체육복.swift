import Foundation

// 전체: n
// 본인 것 가지고 있는 경우: n - lost.count
// 여분 있지만 도난 당함 (본인 것 있지만 빌려줄 수 없음) = lost.filter { reserve.contains($0) }
    
// 빌려야 되는 목록들: lost.filter { !reserve.contains($0) }
// 빌려줄 수 있는 목록들: reserve.filter { !lost.contains($0) }
    
// 빌려줄 수 있는 목록들의 각 element당 -1, +1 해서 빌려야 되는 목록들에 포함되는지 파악하기

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 본인 것 확보
    var count += n - lost.count
        
    // 빌려줄 수 있으면서 도난당한 경우
    count += lost.filter { reserve.contains($0) }.count
        
    // 도난만 당한 경우
    var needsToBorrow = lost.filter { !reserve.contains($0) }
        
    // 도난 없이 빌려줄 수 있는 경우
    var canBorrow = reserve.filter { !lost.contains($0) }
                     
    // ...
}


// 초반부 사고 과정

// 빌려줄 수 있는 학생 숫자 -1, +1 한 학생이 빌려야 하는 학생 목록에 있다면
// 빌려야 하는 학생 목록에서 제거해서 최종적으로 빌려야 하는 학생이 더 없도록 했다

// 문제점: 빌려야 하는 학생이 줄어들면 빌려준 학생도 더 이상 빌려줄 수 없지만 아래의 코드로는 빌려줄 수 있는 상태이다.

// e.g.) lost: [2, 4], reserve: [1, 3, 5]
// lost의 4는 이미 3에게 빌렸지만 5에게 다시 빌릴 수 있어서 count에 추가됨

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    // 위의 조건 그대로...

    for item in canBorrow {
        if needsToBorrow.contains(item-1) {
            count += 1
            needsToBorrow.remove(at: needsToBorrow.firstIndex(of: item-1)!)
        } else if needsToBorrow.contains(item+1) {
            count += 1
            needsToBorrow.remove(at: needsToBorrow.firstIndex(of: item+1)!)
        }
    }
    
    return count
}

// 문제의 목적이 최대한 몇 명이 체육 활동 할 수 있는지 찾는 것이므로, 빌릴 수 있는지 여부가 더 중요하다.
// 빌려야 하는 학생은 결국 빌려줄 수 있는 학생이 있어야 활동이 가능하기 때문에, canBorrow에 존재하는지 여부를 따져야 한다.
// 따라서 빌려야 하는 학생 목록이 아닌 빌려줄 수 있는 학생 목록에서 제거하는 식으로 가야했다.


// 추가 오류

// "lost와 reserve가 정렬되어 있다는 언급이 없기 때문에 예제만 보고 정렬되어 있다고 가정하면 안 됩니다."
// sorted로 정렬해서 제대로 된 크기 비교가 필요했다.


// 최종 결과

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        
    var count += n - lost.count + lost.filter { reserve.contains($0) }.count
        
    let needsToBorrow = lost.filter { !reserve.contains($0) }.sorted()
    var canBorrow = reserve.filter { !lost.contains($0) }.sorted()

    for item in needsToBorrow {
        if canBorrow.contains(item-1) {
            canBorrow.remove(at: canBorrow.firstIndex(of: item-1)!)
            count += 1
        } else if canBorrow.contains(item+1) {
            canBorrow.remove(at: canBorrow.firstIndex(of: item+1)!)
            count += 1
        }
    }
    
    return count
}



// 참조


