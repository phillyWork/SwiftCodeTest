import Foundation

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

// check with isBadVersion, first true one --> first bad one

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        for i in 1...n {
            if isBadVersion(i) {
                return i
            }
        }
        return n
    }
}


// Improvement
// previous code: O(n)

// Search with Binary Search
// O(logn)

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                // right side of mid is bad (not sure whether this is first bad one)
                // --> doesn't need to check right side of mid
                // shrink right range to find first bad version
                right = mid
            } else {
                // left side of mid is not bad
                // --> should check right side of mid
                // shrink left range to find first bad version
                left = mid + 1
            }
        }
        
        return left // `left` points at the first bad version
    }
}
