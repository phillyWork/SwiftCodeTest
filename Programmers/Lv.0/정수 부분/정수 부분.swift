import Foundation

// Int 형변환
// 실수의 정수부분만 가지기 위해 정수형 타입으로 형변환
// Double (8byte) 대비 Int (4byte)의 메모리 용량이 작아지므로 소수점 부분의 데이터는 삭제

func solution(_ flo:Double) -> Int {
    return Int(flo)
}

// 소수점 활용 메서드들

// Equivalent to the 'round' function (소수점 반올림)
var w = 6.5
w.round(.toNearestOrAwayFromZero)

// Equivalent to the 'trunc' function (소수점 버림)
var x = 6.5
x.round(.towardZero)

// Equivalent to the 'ceil' function (소수점 올림)
var y = 6.5
y.round(.up)

// Equivalent to the 'floor' function (소수점 내림)
var z = 6.5
z.round(.down)
