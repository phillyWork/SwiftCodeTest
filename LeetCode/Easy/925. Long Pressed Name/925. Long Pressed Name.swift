import Foundation

// first attempt: count each character's appearance, so that less pressed then original should be filtered

class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var nameCount = [String: Int]()

        for char in name {
            if nameCount[String(char)] != nil {
                nameCount[String(char)]! += 1
            } else {
                nameCount[String(char)] = 1
            }
        }

        for char in typed {
            guard nameCount[String(char)] != nil else {
                return false
            }

            nameCount[String(char)]! -= 1
        }
        
        return nameCount.filter { $0.value > 0 }.isEmpty
    }
}


// Error
// name: rick
// typed: kric
// Expected Output: false
// Output: true

// Error Examination: didn't account for sequence of characters
// "long pressed": characters right next to each other can be equal

class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var i = 0
        var j = 0
        let nameArray = Array(name)
        let typedArray = Array(typed)

        while j < typedArray.count {
            // long pressed
            if i < nameArray.count && nameArray[i] == typedArray[j] {
                i += 1
            // not equal to right next each other
            } else if j == 0 || typedArray[j] != typedArray[j - 1] {
                return false
            }
            
            // name and typed doesn't match
            // typed[j]==type[j-1] case: could be a long press
            j += 1
        }
        
        // check whether traversed all characters of name
        return i == nameArray.count
    }
}
