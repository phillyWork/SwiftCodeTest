import Foundation

// dictionary 구성: key가 element, value가 등장 횟수

func solution(_ array:[Int]) -> Int {
    var counter: [Int: Int] = [:]
    array.forEach { counter[$0] = (counter[$0] ?? 0) + 1 }

    let result = counter.filter { $0.value == counter.values.max() }
    return result.count == 1 ? result.first!.key : -1
}

// init(grouping:by:)
// Creates a new dictionary whose keys are the groupings returned by the given closure and whose values are arrays of the elements that returned each key.

func solution(_ array:[Int]) -> Int {
    let dictionary =  Dictionary(grouping: array) { $0 }.sorted { $0.value.count > $1.value.count }
    return dictionary.count > 1 && dictionary[0].value.count == dictionary[1].value.count ? -1 : dictionary[0].key
}
