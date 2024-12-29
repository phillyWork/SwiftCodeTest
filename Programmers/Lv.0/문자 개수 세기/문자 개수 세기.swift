import Foundation

// 알파벳에 따른 index 값 반환

func getIndex(_ char: String) -> Int {
    switch char {
        case "A": return 0
        case "B": return 1
        case "C": return 2
        case "D": return 3
        case "E": return 4
        case "F": return 5
        case "G": return 6
        case "H": return 7
        case "I": return 8
        case "J": return 9
        case "K": return 10
        case "L": return 11
        case "M": return 12
        case "N": return 13
        case "O": return 14
        case "P": return 15
        case "Q": return 16
        case "R": return 17
        case "S": return 18
        case "T": return 19
        case "U": return 20
        case "V": return 21
        case "W": return 22
        case "X": return 23
        case "Y": return 24
        case "Z": return 25
        case "a": return 26
        case "b": return 27
        case "c": return 28
        case "d": return 29
        case "e": return 30
        case "f": return 31
        case "g": return 32
        case "h": return 33
        case "i": return 34
        case "j": return 35
        case "k": return 36
        case "l": return 37
        case "m": return 38
        case "n": return 39
        case "o": return 40
        case "p": return 41
        case "q": return 42
        case "r": return 43
        case "s": return 44
        case "t": return 45
        case "u": return 46
        case "v": return 47
        case "w": return 48
        case "x": return 49
        case "y": return 50
        case "z": return 51
        default: return -1
    }
}

func solution(_ my_string:String) -> [Int] {
    
    var dict = [String : Int]()
    var result = Array(repeating: 0, count: 52)
    
    for char in my_string {
        if let str = dict[String(char)] {
            dict[String(char)]! += 1
        } else {
            dict[String(char)] = 1
        }
    }

    for (key, value) in dict {
        result[getIndex(key)] = value
    }
    
    return result
}


// 개선: ASCII 값 활용

// A ~ Z: 65 ~ 90
// a ~ z: 97 ~ 122

// 원하는 index

// A ~ Z: 0 ~ 25
// a ~ z: 26 ~ 51

func solution(_ my_string:String) -> [Int] {
    var answer = Array(repeating: 0, count: 52)
    my_string.forEach { answer[Int($0.asciiValue! - ($0.isUppercase ? 65 : 71))] += 1 }
    return answer
}
