import Foundation

// Dictionary 활용, 이름에 해당하는 점수 여부 확인해서 정수값으로 변경하기

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var point = Dictionary<String, Int>()
    for i in 0..<name.count {
        point[name[i]] = yearning[i]
    }
    return photo.map { $0.map { point[$0] ?? 0 }.reduce(0, +) }
}

// 직접 모든 element를 대응하기 보단 zip 활용해서 dictionary 쉽게 만들기

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
}
