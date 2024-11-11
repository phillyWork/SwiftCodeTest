import Foundation

// 4점만 주어지므로 4C2인 6가지 중 절반인 세 경우만 따지면 나머지는 알아서 구해질 수 있다.

func slope(_ dot1: [Int], _ dot2: [Int]) -> Double {
    let xDiff = dot1[0] - dot2[0]
    let yDiff = dot1[1] - dot2[1]
    return Double(yDiff)/Double(xDiff)
}


func solution(_ dots:[[Int]]) -> Int {
    if
    slope(dots[0], dots[1]) == slope(dots[2], dots[3]) ||
    slope(dots[0], dots[2]) == slope(dots[1], dots[3]) ||
    slope(dots[0], dots[3]) == slope(dots[1], dots[2])
    {
        return 1
    } else {
        return 0
    }
}



// 틀린 풀이 사고 과정

// 평행의 의미 중 "기울기가 동일하다"에 너무 집중해서
// bubble sort로 각 점끼리의 기울기를 가지는 배열에서 새로 구한 기울기가 포함되어있으면 평행하다고 생각하고 코드를 작성했다.

func solution(_ dots:[[Int]]) -> Int {
    var slopes = [Double]()
    for i in 0...2 {
        for j in i+1...3 {
            let xDiff = dots[i][0] - dots[j][0]
            let yDiff = dots[i][1] - dots[j][1]
            let slopeP = Double(yDiff)/Double(xDiff)
            if slopes.contains(slopeP) {
                return 1
            } else {
                slopes.append(slopeP)
            }
        }
    }
    return 0
}

// 간과한 점이 평행의 정의를 이루는 "서로 다른 두 직선"이었다.

// dots    result
// [[2, 2], [4, 4], [6, 6], [8, 10]]    0

// 기울기를 구하면 다음과 같다.
// line1    slope1    line2    slope2
// [[2, 2], [4, 4]]    1    [6, 6], [8, 10]    2
// [[2, 2], [6, 6]]    1    [4, 4], [8, 10]    3/2
// [[2, 2], [8, 10]]    5/4    [4, 4], [6, 6]    1

// 평행한 두 직선은 없지만, 기울기가 동일한 직선들은 3개나 나오기에 위 풀이로는 평행하다고 잘못된 판단을 한다.
