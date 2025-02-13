import Foundation

// 시도

// n보다 큰 수와 작은 수로 나누기
// 큰 쪽과 n의 차이, 작은 쪽과 n의 차이 비교해서 차이가 적은 쪽 우선으로 더하기
// 한쪽 처리 완료: 나머지를 추가

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    
    let sortedNum = numlist.sorted()
    var splitPoint = sortedNum.count
    
    var result = [Int]()
    var smallIndex = 0
    var bigIndex = 0
    
    for (index, value) in sortedNum.enumerated() {
        if value > n {
            splitPoint = index
            break
        }
    }
        
    let smallN = Array(sortedNum.prefix(splitPoint).reversed())
    let bigN = sortedNum.suffix(numlist.count - splitPoint)
    
    while (smallIndex < smallN.count || bigIndex < bigN.count) {
        let smallDiff = smallIndex < smallN.count ? abs(n - smallN[smallIndex]) : Int.max
        let bigDiff = bigIndex < bigN.count ? abs(n - bigN[bigIndex]) : Int.max
        
       if smallDiff < bigDiff {
            result.append(smallN[smallIndex])
            smallIndex += 1
        } else if bigDiff < smallDiff {
            result.append(bigN[bigIndex])
            bigIndex += 1
        } else {
            if smallIndex < smallN.count && bigIndex < bigN.count {
                if smallN[smallIndex] < bigN[bigIndex] {
                    result.append(bigN[bigIndex])
                    bigIndex += 1
                } else {
                    result.append(smallN[smallIndex])
                    smallIndex += 1
                }
            } else if smallIndex < smallN.count {
                result.append(smallN[smallIndex])
                smallIndex += 1
            } else if bigIndex < bigN.count {
                result.append(bigN[bigIndex])
                bigIndex += 1
            }
        }
          
    }
     
    return result
}


// 에러
// splitPoint가 n일 때의 계산이 누락될 가능성 존재
// 연산 횟수가 너무 중첩되어 많음


// 해결
// 차이 계산 활용, 개별 element끼리 비교해서 정렬하기

func solution(_ numlist: [Int], _ n: Int) -> [Int] {
    return numlist.sorted {
        let diff1 = abs($0 - n)
        let diff2 = abs($1 - n)
        
        if diff1 == diff2 {
            return $0 > $1  // 더 큰 숫자가 앞에 오도록 정렬
        }
        return diff1 < diff2  // 거리가 가까운 순서로 정렬
    }
}


// 중복된 원소 없으므로 dict 활용
// [정수 : n까지와의 거리]
// 거리가 같은 경우 더 큰수를 앞에 배치해야 하므로 딕셔너리 정렬에 key와 value를 동시에 사용
// 정렬된 딕셔너리의 타입은 Array<(key: Int, value: Int)>이므로 key만 따로 추출하여 결과 배열로 사용

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    var result: [Int] = []
    var dict: [Int:Int] = [:]

    for num in numlist {
        dict[num] = abs(num - n)
    }

    let sortedDict = dict.sorted(by: { first, second in
        if first.value == second.value {
            return first.key > second.key
        }
        return first.value < second.value
    })
    
    result = sortedDict.map{ $0.key }
    return result
}



// tuple로 비교
// 차이가 같다면, 더 큰 수 넣기 --> 음수화해서 더 작은 수 넣는 것이 더 큰 수 넣는 것 의미

// e.g.) n: 5
// $0: 3, $5: 7
// 7이 더 앞으로 와야하지만, 차이가 작은 것이 더 우선되므로 작은 것 계산을 중심으로 우회하면 음수화해서 더 작은 수를 앞에 놓기
// -3 > -7

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: { (abs($0 - n), -$0) < (abs($1 - n), -$1) })
}
