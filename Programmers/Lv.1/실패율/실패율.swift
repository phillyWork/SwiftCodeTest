import Foundation

// tuple을 활용해서 stage와 failure 수치를 저장

// 시간 소요가 꽤 걸림 & 실패율 계산 정의와 일치하지 않는 오류도 존재

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var tuple = [(Int, Double)]()  // [스테이지: 실패율]
    var player = stages.count
    
    // 각 stage
    for i in 1...N {
        // 현재 스테이지에 도달한 사람 수
        var current = 0
        for j in 0..<stages.count {
            // 주어진 stage와 해당 stage 일치
            if stages[j] == i {
               current += 1
            }
        }
        
        // player: 도달하고 clear한 사람 수
        player -= current
            
        var failure = Double(current) / Double(player)
        tuple.append((i, failure))
    }
    
    tuple = tuple.sorted(by: {$0.1 > $1.1 })
        
    return tuple.map{ $0.0 }
}

// 도달하고 clear한 배열을 매번 구하면 시간 초과가 날 수 있으므로, 누적합을 활용
// e.g.) stage 4 clear: stage 3까지의 clear 합을 활용

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // clear: 도달 & clear
    var clear = Array(repeating: 0, count: N+2)
    // approachNotClear: 도달, but not clear
    var approachNotClear = Array(repeating: 0, count: N+2)
    
    // 각 도달한 stage input을 받아 현재 도달한 stage 및 그 이전 clear stage에 추가
    for stage in stages {
        approachNotClear[stage] += 1
        clear[stage - 1] += 1
    }
    
    // 도달한 stage의 이전 stage들의 clear를 누적합으로 구해줘야 함
    for i in stride(from: N, through: 0, by: -1) {
        clear[i] += clear[i+1]
    }
    
    // 배열 2개를 zip을 활용해 sequence 쌍으로 만듬
    return zip(clear[1...], approachNotClear[1...]).enumerated().map {
        // failure 값 얻기
        (index: Int, value: (clear: Int, notClear: Int)) -> (Int, Double) in
            let total = value.clear + value.notClear
            if total == 0 {     // 모두 clear
                return (index+1, 0)
            } else {            // 도달했지만 clear하지 못한 경우
                return (index+1, Double(value.notClear) / Double(total))
            }
        // (N+2)번째는 제외하고, failure값 내림차순 정렬
        }.dropLast().sorted {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return $0.1 > $1.1
            }
        // 그 때의 stage값을 return
        }.map { $0.0 }
}


// 오류 사고 과정

// 각 stage별 도달한 사람 수를 담은 배열과 도달했지만 아직 clear하지 못한 수를 담은 배열 2개를 구해서,
// dictionary로 각 stage 별 failure 수치를 구한 다음, max 순서대로 결과 배열에 넣으면 된다고 생각했다.

// overflow 발생

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var approach = [Int]()
    var approachNotClear = [Int]()
    var dictFailure = [Int: Double]()
    var result = [Int]()

    for i in 0..<N {
        approach[i] = 0
        approachNotClear[i] = 0
    }
    
    for stage in stages {
        var i = 0
        while i < stage-1 {
            approach[i] += 1
            i += 1
        }
        if i <= N {
            approachNotClear[i] += 1
        }
    }
    
    for i in 0..<N {
        dictFailure[i+1] = Double(approachNotClear[i])/Double(approach[i])
    }
    
    for i in 1...N {
        let maxValue = dictFailure.max { a, b in a.value < b.value }
        result.append(Int(maxValue!.key))
        dictFailure.removeValue(forKey: maxValue!.key)
    }
    
    return result
}


