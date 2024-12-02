import Foundation

// 경우의 수: 6개 모두 불일치 ~ 6개 모두 일치: 7가지

// 시작 순위: [가능한 최고 순위, 가능한 최저 순위]

// 1개 이하 일치: 6위로 간주
// 최저 순위를 7위로 시작, 1개만 일치해도 6위로 가도록 설정

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var result = [1, 7]
            
    for num in lottos {
        if win_nums.contains(num) {     // 당첨 번호 포함: 최저 순위 상승
            result[1] -= 1
        } else if num != 0 {            // 당첨 번호 미포함 && 알려진 숫자: 최고 순위 하락
            result[0] += 1
        }
    }
    
    // 하나도 일치하지 않는 경우: result[0] 값 7
    // 하나도 알아볼 수 없는 경우: result[1] 값 7
    // 7인 경우 6으로 조정하기
    return result.map { $0 > 6 ? 6 : $0 }
}


// 다른 풀이

// 알아볼 수 없는 경우 개수 구하기
// 최고 순위: 맞춘 개수 & 알아볼 수 없는 개수 빼기 (알아볼 수 없는 수 다 맞음 가정)
// 최저 순위: 맞춘 개수 빼기 (알아볼 수 없는 수 다 틀림 가정)

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

    let zeroCount = lottos.filter { $0 == 0 }.count
    let winCount: Int = win_nums.filter { lottos.contains($0) }.count

    // min값으로 하나도 못맞춤 or 하나도 모름 경우 방지하기
    return [min(7-winCount-zeroCount, 6), min(7-winCount, 6)]
}


// 최고 순위: 7개 숫자 - (포함된 개수 혹은 알려지지 않는 것 모두 맞았다는 가정)의 개수

// 최저 순위: 7개 숫자 - (포함된 개수)
// 알려지지 않은 것 모두 틀렸다는 가정

// 7개인 경우, 6개로 맞추기

func solution(_ lottos: [Int], _ winNums: [Int]) -> [Int] {
    return [
        (lottos.count + 1) - lottos.filter { winNums.contains($0) || $0 == 0 }.count,
        (lottos.count + 1) - lottos.filter(winNums.contains).count
    ].map { $0 > 6 ? $0 - 1 : $0 }
}


// intersection 활용하기

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let mine = Set(lottos)
    let winner = Set(win_nums)
    let score = mine.intersection(winner).count         // 일치하는 숫자 개수
    let joker = lottos.filter { $0 == 0 }.count         // 0의 개수
    let ranking = [6, 6, 5, 4, 3, 2, 1]
    return [ranking[score + joker], ranking[score]]
}
