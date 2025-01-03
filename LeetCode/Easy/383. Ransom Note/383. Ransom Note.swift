import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        //ransom is longer than magazine, can't make it
        if ransomNote.count > magazine.count {
            return false
        }
        
        var ransomDict: [Character: Int] = [:]
        var magDict: [Character: Int] = [:]
        
        for c in magazine {
            if magDict[c] != nil {
                magDict[c]! += 1
            } else {
                magDict[c] = 1
            }
        }
        
        for c in ransomNote {
            if ransomDict[c] != nil {
                ransomDict[c]! += 1
            } else {
                ransomDict[c] = 1
            }
        }
        
        for key in ransomDict.keys {
            //no character in mag, can't make mag by ransom
            guard let magCount = magDict[key] else { return false }
            //ransom has more characters than magazine, can't make it
            if magCount < ransomDict[key]! {
                return false
            }
        }
        
        return true
    }
}


// goal: check whether ransom note can be made from magazine
// --> reverse approach: check whether copyMagazine contains whole ransom note

class Solution {
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var copyMagazine = magazine
        
        for ran in ransomNote {
            if let index = copyMagazine.firstIndex(of: ran) {
                copyMagazine.remove(at: index)
            } else {
                return false
            }
        }
        
        return true
    }
}
