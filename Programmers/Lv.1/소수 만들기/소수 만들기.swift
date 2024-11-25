import Foundation

// 3개 숫자 뽑아서 더하기

// 단순 해결: 3중 for문

// 소수 여부 판단할 배열 따로 구성

import Foundation

func setupPrime(max n: Int) -> [Int] {
    var num = Array(repeating: 0, count: n+1)
    var primes = [Int]()
    for i in 2...n {
        if num[i] == 0 {
            primes.append(i)
            for j in stride(from: i, to: n+1, by: i) {
                num[j] = 1
            }
        }
    }
    return primes
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    // 가장 큰 3개 합까지 소수 따지기
    let primeArray = setupPrime(max: nums.sorted(by: >)[0...2].reduce(0, +))
    
    for i in (0..<nums.count-2) {
        for j in (i+1..<nums.count-1) {
            for k in (j+1..<nums.count) {
                if primeArray.contains(nums[i]+nums[j]+nums[k]) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}


// 문제점: 시간복잡도 최악 O(n^3)

// 3개 element 뽑기: 중복 없이 결국 모두 뽑을 것이므로 조합(Combination)을 활용

// nCr = n-1Cr-1 + n-cCr 활용, 재귀로 찾기

func combinations<T>(_ array: [T], choose k: Int) -> [[T]] {
    if k == 0 { return [[]] }                               // 더 이상 뽑을 개수 없다면 빈 배열 반환
    guard let first = array.first else { return [] }        // element 없다면 빈 배열 반환
    
    // 맨 앞 element 제외한 나머지 배열
    let rest = Array(array.dropFirst())
    
    // 뽑은 element 제외한 배열에서 k-1개 중 뽑기
    // 그 후, 뽑은 element 배열에 추가하기
    let withFirst = combinations(rest, choose: k - 1).map { [first] + $0 }
    
    // 뽑은 element 제외한 배열에서 k개 뽑기
    let withoutFirst = combinations(rest, choose: k)
    
    // 최종적으로 element 3개짜리 배열 만들기
    return withFirst + withoutFirst
}

func solution(_ nums: [Int]) -> Int {
    let primeSet = setupPrime(max: nums.sorted(by: >)[0...2].reduce(0, +))
    let combs = combinations(nums, choose: 3)
    
    // 3개 element 더한 값으로 만들기
    // 더한 값이 primeSet에 존재하는지 여부로 filter
    return combs.map { $0.reduce(0, +) }.filter { primeSet.contains($0) }.count
}
