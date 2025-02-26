import Foundation

// filter who didn't met target hour, then count them up

class Solution {
    func numberOfEmployeesWhoMetTarget(_ hours: [Int], _ target: Int) -> Int {
        return hours.filter { $0 >= target }.count
    }
}

// use reduce to take both filter and count work at the same time

class Solution {
    func numberOfEmployeesWhoMetTarget(_ hours: [Int], _ target: Int) -> Int {
        hours.reduce(0) { $1 >= target ? $0 + 1 : $0 }
    }
}
