import Foundation

// Dictionary 활용
// 우선순위 용도의 변수를 따로 활용해서 매 element마다 우선순위를 저장,
// 실제 배열에서 해당 element의 우선순위만 새로운 배열에 추가

func solution(_ emergency:[Int]) -> [Int] {
    var rankedDict = [Int: Int]()
    var result = [Int]()
    var rank = 1
    
    for num in emergency.sorted(by: >) {
        rankedDict[num] = rank
        rank += 1
    }
    
    for num in emergency {
        result.append(rankedDict[num]!)
    }
    
    return result
}

// 내림차순 정렬 없이 filter로 등수 계산
// emergency의 각 element마다 해당 element보다 큰 수만 남긴 개수 + 1로 우선순위를 계산해서 저장
// 각 element마다 filter 함수를 수행해야 하므로 시간복잡도는 더 높아질 수 있음

func solution(_ emergency:[Int]) -> [Int] {
    var answer: [Int] = []

    for num in emergency {
        answer.append(emergency.filter { $0 > num }.count + 1)
    }

    return answer
}

// 내림차순 정렬된 배열에서 원본 배열의 각 element의 위치 구하기
// 각 element마다 sorted를 수행해서 전체 시간복잡도는 더 높아질 수 있는 우려점 존재

func solution(_ emergency: [Int]) -> [Int] {
    return emergency.map { emergency.sorted(by: >).firstIndex(of: $0)! + 1 }
}
