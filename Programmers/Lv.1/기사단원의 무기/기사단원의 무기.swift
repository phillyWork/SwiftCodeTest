import Foundation

// 1부터 n까지의 숫자마다 약수 개수 구하기
// 제곱근 계산으로 정수 제곱인 경우 따지기

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var totalWeight = 0

    for num in 1...number {
        var divisorCount = 0
        let sqrtNum = Int(Double(num).squareRoot())

        for i in 1...sqrtNum {
            if num % i == 0 {
                divisorCount += (i * i == num) ? 1 : 2
                if divisorCount > limit {
                    divisorCount = power
                    break
                }
            }
        }

        totalWeight += divisorCount
    }

    return totalWeight
}


// 시도한 방법
// 2부터 n까지 sequence마다 약수 개수를 구해서 reduce로 최종합 구하기

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    return (2...number).reduce(1) { sum, num in
        let sqrtNum = Int(sqrt(Double(num)))
        var count = 0
        for i in (1...sqrtNum) {
            if num % i == 0 {
                count += i*i == num ? 1 : 2
                if count > limit {
                    count = power
                    break
                }
            }
        }
        return sum + count
    }
    
}

// 문제점: Core Dump 테스트 케이스 항상 발생 (스택 오버플로우 발생)
// 원인 추정: reduce를 수행하는 모든 수마다 for loop 수행
// number의 크기가 커질 수록 연산 수행 횟수 크게 증가


// 해결책: 명시적 반복문 위주로 활용
// reduce는 중간 결과를 메모리에 계속해서 저장하므로 reduce가 처리할 연산 단위를 작게 설정 (e.g. 덧셈 처리)

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    var divisorCount = [Int](repeating: 0, count: number+1)
    
    for i in 1...number {
        var count = i
        
        while count <= number {
            divisorCount[count] += 1
            count += i
        }
    }

    return divisorCount.map { $0 > limit ? power : $0 }.reduce(0, +)
    
}
