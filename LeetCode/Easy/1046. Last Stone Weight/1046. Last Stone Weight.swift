import Foundation

// only need to check max value: no need to consider original order

// remove seoncd max value always
// check only first max is equal to second max

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var result = stones

        while result.count > 1 {
            result.sort(by: >)
            
            let max = result[0]
            let second = result[1]
            
            result.remove(at: 1)
            if max == second {
                result.remove(at: 0)
            } else {
                result[0] = max - second
            }
        }

        return result.isEmpty ? 0 : result[0]
    }
}


// Improvement
// use max heap instead of sorting every time

// should define heap because swift doesn't provide heap struct

// Max Heap
struct Heap<T> {
    private var elements: [T] = []
    private let areSorted: (T, T) -> Bool

    init(_ elements: [T] = [], areSorted: @escaping (T, T) -> Bool) {
        self.areSorted = areSorted
        self.elements = elements
        buildHeap()
    }

    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    func peek() -> T? { elements.first }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    mutating func remove() -> T {
        let value = elements[0]
        elements.swapAt(0, elements.count - 1)
        elements.removeLast()
        siftDown(from: 0)
        return value
    }

    private mutating func buildHeap() {
        for index in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: index)
        }
    }

    // for insertion: update when child is bigger than parent
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0, areSorted(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    // for removal: update when parent is smaller than child
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < elements.count, areSorted(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count, areSorted(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = Heap(stones, areSorted: >) // Max Heap

        while heap.count > 1 {
            let y = heap.remove() // max value
            let x = heap.remove() // second value

            if y != x {
                heap.insert(y - x)
            }
        }

        return heap.isEmpty ? 0 : heap.peek()!
    }
}
