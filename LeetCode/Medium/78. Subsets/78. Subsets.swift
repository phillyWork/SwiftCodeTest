import Foundation

// first attempt

// check subsets of each element count (0, 1, 2, ... n)
// for each element count, create subset and addup to total result

func countNCR(_ n: Int, _ r: Int) -> Int {
    if n == 1 || r == 0 { return 1 }
    return countNCR(n-1, r-1) + countNCR(n, r-1)
}

// create and check duplicate subsets with each count of elements which should be contained
func createSubsets(_ nums: [Int], _ elemCount: Int) -> [Int] {
    // count of subsets which should contain that number of elements
    let subsetCount = countNCR(nums.count, elemCount)
    var currentCount = 0

    var result = [Int]()
    
    // should create each tempSubset from original array
    
    while currentCount != subsetCount {
        
        let tempSubset = createSubset(nums, [], elemCount)
        
        if !result.contains(tempSubset) {
            result.append(tempSubset)
            currentCount += 1
        }
    }
    
    return result
}


// problem: can't track which element is already added or not in creating subset

func createSubset(_ nums: [Int], _ current: [Int], _ elemCount: Int) -> [Int] {
    if elemCount == 0 { return current }

}



// should backtrack which element is already check(added) or not
// need to consider "inout" for modifying final result and current cases

class Solution {
    
    // Function to generate all subsets of a given size
    func createSubsets(_ nums: [Int], _ elemCount: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        createSubsetHelper(nums, &current, 0, elemCount, &result)
        return result
    }
    
    // Helper function for backtracking
    func createSubsetHelper(_ nums: [Int], _ current: inout [Int], _ index: Int, _ elemCount: Int, _ result: inout [[Int]]) {
        // Base case: If the required number of elements is reached
        if current.count == elemCount {
            result.append(current)
            return
        }
        
        // Explore further elements
        // nCr --> pick one element from nCr, check n-1Cr-1 with createSubsetHelper, then remove to check next element for nCr
        for i in index..<nums.count {
            current.append(nums[i])
            createSubsetHelper(nums, &current, i + 1, elemCount, &result)
            current.removeLast() // Backtrack
        }
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        // Generate subsets for each size from 0 to nums.count
        for i in 0...nums.count {
            result.append(contentsOf: createSubsets(nums, i))
        }
        
        return result
    }
}



// simple but duplicated for-loop

// Add one integer every time. Not only add to ans array, but add a integer to ans array 's element.

// consider all elements are unique --> add up elements to previously added subsets --> still unique, no duplicate
// add up that new element as single element case

func subsets(_ nums: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    
    // e.g.) [2, 3, 4, 5, 6]
    // i == 0 ~ ans: [] --> [2]
    // i == 1: add up 3 to [2], add up [2,3], [3]
    // ans: [2] --> [2], [2, 3], [3]
    for i in 0..<nums.count{
        
        // start with already added subset cases
        for j in 0..<ans.count{
            var temp = ans[j]
            temp.append(nums[i])
            ans.append(temp)
        }
        
        // adding single element case
        ans.append([nums[i]])
    }
    
    // no element case
    ans.append([])
    
    return ans
}
