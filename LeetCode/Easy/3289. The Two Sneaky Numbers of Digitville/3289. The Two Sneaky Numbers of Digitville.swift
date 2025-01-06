import Foundation

// check double containment via reduce method with dictionary

class Solution {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        
        var dict = [Int: Int]()

        for num in nums {
            if let value = dict[num] {
                dict[num]! += 1
            } else {
                dict[num] = 1
            }
        }

        return dict.reduce([]) { (result, current) in
            var temp = result
            if current.value > 1 {
                temp.append(current.key)
            }
            return temp
        }.sorted(by: <)

    }
}

// using just array
// nums.length : n+2 (containing same number twice)
// --> set array size as n (0 ~ n-1)

class Solution {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        
        var count = Array(repeating: 0, count: nums.count - 2)
        var result = [Int]()
        
        for num in nums {
            count[num] += 1
        }
        
        for i in 0..<nums.count - 2 {
            if count[i] == 2 {
                result.append(i)
            }
        }
        
        return result
    }
}


// using Set for unique containment

class Solution {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        
        var arrUnique = Set<Int>()
        var ans: [Int] = []
        for num in nums {
            if arrUnique.contains(num){
                ans.append(num)
            }else{
                arrUnique.insert(num)
            }
        }
        return ans
    }
}



