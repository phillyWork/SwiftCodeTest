import Foundation

func solution(_ sides:[Int]) -> Int {
    
    let sortedSides = sides.sorted(by: >)
    
    let sumSides = sortedSides[0] + sortedSides[1]
    
    // sortedSides[1] + k > sortedSides[0]
    // max: sortedSides[0]
    
    let sortedLongest = (sortedSides[0]-sortedSides[1]+1...sortedSides[0]).count
    
    // k < sortedSides[0] + sortedSides[1]
    // min: sortedSides[0]+1
    
    let remainLongest = (sortedSides[0]+1..<sumSides).count
    
    return remainLongest + sortedLongest
    
}


// sides.max()! - (sides.max()! - sides.min()!)
// 새로운 변이 가장 긴 변이 되는 경우

// sides.reduce(0, +) - sides.max()!
// 새로운 변이 가장 긴 변이 아닌 경우

// -1: 중복 제거 (세변이 기존의 가장 긴 변과 같은 경우 두 번 계산)

func solution(_ sides: [Int]) -> Int {
    return sides.max()! - (sides.max()! - sides.min()!) + sides.reduce(0, +) - sides.max()! - 1
}
