import Foundation

// replacingOccurrences 활용

func solution(_ rny_string:String) -> String {
    return rny_string.replacingOccurrences(of: "m", with: "rn")
}

// map & joined 활용

func solution(_ rny_string:String) -> String {
    return rny_string.map { return $0 == "m" ? "rn" : String($0) }.joined()
}
