import Foundation

// 역순으로 바뀐 collection을 얻은 뒤, String type으로 형변환
// argument로 들어오는 my_string이 let이므로 reverse로 변형할 수 없으므로 reversed를 활용

// mutating func reverse()
// reverse: 해당 collection 자체를 변경

// func reversed() -> ReversedCollection<Self>
// 원본 collection을 변경한 새로운 collection 반환

func solution(_ my_string:String) -> String {
    return String(my_string.reversed())
}
