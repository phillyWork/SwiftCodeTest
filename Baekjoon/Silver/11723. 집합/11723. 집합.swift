import Foundation

// 문제 난이도는 높지 않지만 Swift 시간 복잡도 처리 관련 최적화 논란

// 첫 시도: Set 활용해서 해결하기
// M ≤ 3,000,000인 경우 readLine()에서는 시간 초과 발생

enum Calculation: String {
    case add = "add"
    case remove = "remove"
    case check = "check"
    case toggle = "toggle"
}

let count = Int(readLine()!)!
var numSet = Set<Int>()

for _ in 0..<count {
    let command = readLine()!.split(separator: " ").map { String($0) }
    if command.count == 1 {
        if command[0] == "all" {
            numSet = Set(1..<21)
        } else {
            numSet.removeAll()
        }
    } else {
        let num = Int(command[1])!
        switch Calculation(rawValue: command[0]) {
        case .add: numSet.insert(num)
        case .remove: numSet.remove(num)
        case .check: numSet.contains(num) ? print(1) : print(0)
        case .toggle:
            if numSet.contains(num) {
                numSet.remove(num)
            } else {
                numSet.insert(num)
            }
        default: print(0)
        }
    }
}

// Set: 내부의 해시 테이블
// element 20개 다루는 경우: 메모리 오버헤드 우려 존재 (큰 크기의 데이터 활용할 때 더 효율적)
// 고정된 작은 크기의 데이터를 대규모 횟수의 연산 처리 하는 경우: 다른 자료구조 활용 필요

// 비트마스크 활용
// Bitmask: 정수를 이진수로 나타내서 연산
// 연산 속도 빠름, 더 작은 메모리 활용

// 비트 연산: & (AND), | (OR), ^ (XOR), ~ (NOT), >>/<< (SHIFT)

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        // 음수 처리
        if now == 45 {
            isPositive.toggle()
            now = read()
        }

        // 숫자 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
}

let file = FileIO()
let count = file.readInt()
var bitset: UInt32 = 0
var result = ""

for _ in 0..<count {
    let command = file.readString()
    switch command {
    case "add":
        bitset |= 1 << (file.readInt() - 1)
    case "remove":
        bitset &= ~(1 << (file.readInt() - 1))
    case "check":
        result += ((bitset & (1 << (file.readInt() - 1))) != 0) ? "1\n" : "0\n"
    case "toggle":
        bitset ^= 1 << (file.readInt() - 1)
    case "all":
        bitset = 0xFFFFF // 20비트 모두 1로 설정 (1 ~ 20 모두 1로 들어옴)
    case "empty":
        bitset = 0 // 20비트 모두 0
    default:
        break
    }
}

print(result)


// 여전히 시간 초과 발생

// 최종 해결: 각 명령 처리를 문자열이 아닌 ASCII 값 비교로 더 빠르게 처리하기
// String --> Byte로 변환하기

import Foundation

class FileIO {
    
    // [0]: 범위 벗어나는 읽기 금지
    // byteIdx: 현재 읽고 있는 버퍼의 인덱스
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    // 1 byte 읽고 반환
    @inline(__always) private func readByte() -> UInt8 {
        // defer: 함수 종료시에 수행 ~ byteIdx + 1 수행
        defer { byteIdx += 1 }
        // withUnsafeBufferPointer: 버퍼에 직접 접근 (성능 향상 목적)
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    // 버퍼에서 정수 읽기
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        
        // 공백(10), 줄바꿈(32) 무시
        while byte == 10 || byte == 32 { byte = readByte() }
        
        // 음수 부호(45) 처리
        if byte == 45 { byte = readByte(); isNegative = true }
        
        // 숫자 (48 ~ 57) 읽어 정수 변환
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        
        return number * (isNegative ? -1 : 1)
    }
    
    // 문자열 읽고 ASCII 값의 합 반환
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        
        // 공백(10), 줄바꿈(32) 무시
        while byte == 10 || byte == 32 { byte = readByte() }
        
        var sum = Int(byte)
        
        // 문자열의 끝(공백(10), 줄바꿈(32), 또는 null(0))을 만날 때까지 각 바이트의 값을 더하기
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        
        // 마지막에 더해진 종료 문자의 값을 빼서 반환
        return sum - Int(byte)
    }
    
    // 문자열 표준 출력으로 작성 (utf8 인코딩)
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let file = FileIO()
var m = file.readInt()      // 총 명렁 횟수

var bit = 0
var result = ""

while m != 0 {
    switch file.readStirngSum() {
        case 297:       // add: 입력받은 숫자에 해당하는 비트를 1로 설정
            bit |= (1 << file.readInt())
        case 654:       // remove: 입력받은 숫자에 해당하는 비트를 0으로 설정
            bit &= ~(1 << file.readInt())
        case 510:       // check: 입력받은 숫자에 해당하는 비트가 1인지 여부에 따라 결정
            if (bit & (1 << file.readInt()) != 0){
                result.append("1\n")
            } else {
                result.append("0\n")
        }
        case 642:       // toggle: 입력받은 숫자에 해당하는 비트를 반전
            bit ^= (1 << file.readInt())
        case 313:       // all: 모든 비트 1로 설정
            bit |= (~0)
        case 559:       // empty: 모든 비트 0으로 설정
            bit &= 0
        default:
            break
    }
    m -= 1
}

print(result)
