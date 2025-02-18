import Foundation

// attempt
// 1. check peak point by comparing adjacent values with updating max value for real peak
// 2. divide into ascending and descending arrays
// 3. check each array whether it is going as its way

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {

        guard arr.count > 1 else { return false }

        var peak = -1
        var maxValue = -1

        for i in 0..<arr.count-1 {

            if (arr[i] > arr[i+1]) && (maxValue == max(maxValue, arr[i])) {
                print("found peak: \(i)")
                peak = i
                break
            }
            
            maxValue = max(maxValue, arr[i])
        }

        guard peak > 0 else { return false }

        let asecArr = Array(arr.prefix(peak))
        let descArr = Array(arr.suffix(arr.count - 1 - peak))

        guard asecArr.count > 0 && descArr.count > 0 else { return false }

        for i in 0..<asecArr.count - 1 {
            if asecArr[i] >= asecArr[i+1] {
                return false
            }
        }

        for i in 0..<descArr.count - 1 {
            if descArr[i] <= descArr[i+1] {
                return false
            }
        }

        return true
    }
}


// Error
// Can't check minimum mountain size
// maxValue update timing is not working as it is --> don't need peak point
// don't have to make extra arrays --> instead just check on original one


// Improvement
// check only in original array with comparing adjacent values

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {

        // minimum mountain requirement: peak point with each end --> 3 elements needed
        guard arr.count >= 3 else { return false }

        var peak = -1

        // check if descending point appears
        for i in 0..<arr.count-1 {
            if arr[i] >= arr[i+1] {
                peak = i
                break
            }
        }

        // check peak point validity
        guard peak > 0, peak < arr.count - 1 else { return false }

        // checking descending with start point of peak
        for i in peak..<arr.count - 1 {
            if arr[i] <= arr[i+1] {
                return false
            }
        }

        return true
    }
}


// Improvement
// assume it's valid mountain --> check index increment progress
// if something not right: not valid --> return false

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else { return false }

        var i = 0
        let n = arr.count

        // check ascending
        while i + 1 < n && arr[i] < arr[i + 1] {
            i += 1
        }

        // if peak point is at the start (all descending) or end point (all ascending) --> not a mountain
        if i == 0 || i == n - 1 {
            return false
        }

        // check descending
        while i + 1 < n && arr[i] > arr[i + 1] {
            i += 1
        }

        // if valid mountain, index should be at the end point
        return i == n - 1
    }
}
