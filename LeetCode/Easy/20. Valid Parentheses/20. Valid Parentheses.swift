import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for c in s {
            switch c {
                case "(", "{", "[":
                    stack.append(c)
                case ")":
                    if stack.last != "(" || stack.isEmpty {
                        return false
                    }
                    stack.removeLast()
                case "]":
                    if stack.last != "[" || stack.isEmpty {
                        return false
                    }
                    stack.removeLast()
                case "}":
                    if stack.last != "{" || stack.isEmpty {
                        return false
                    }
                    stack.removeLast()
                default:
                    print("It's progressing")
            }
        }
        return stack.isEmpty
    }
}

// improvement: check opening bracket cases into big one case (same for closing)

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let dict: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
        
        for char in s {
            switch char {
            case "(", "{", "[": stack.append(char)
            case ")", "}", "]": guard !stack.isEmpty, dict[stack.removeLast()] == char else { return false }
            default: return false
            }
        }
        
        return stack.isEmpty
    }

}


// not using switch

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let matchingBrackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        
        for char in s {
            if let matchingOpen = matchingBrackets[char] {
                // closing bracket
                if stack.isEmpty || stack.last != matchingOpen {
                    return false
                }
                stack.removeLast()
            } else {
                // opening bracket
                stack.append(char)
            }
        }
        
        return stack.isEmpty
    }
}
