import Foundation

// first attempt:
// turn binary digit num into decimal
// add up them and change into binary

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let result = Int(a, radix: 2)! + Int(b, radix: 2)!
        return String(result, radix: 2)
    }
}

// Error
/*
 *** Signal 4: Backtracing from 0x559bee4f1cd0... done ***
 *** Program crashed: Illegal instruction at 0x0000559bee4f1cd0 ***
 Thread 0 "prog" crashed:
 0  0x0000559bee4f1cd0 specialized Solution.addBinary(_:_:) + 880 in prog
 Registers:
 rax 0x0000000000000000  0
 rdx 0x0000559beebe0d20  70 83 09 71 92 7f 00 00 03 00 00 00 00 00 00 00  p··q············
 rcx 0x0000000000000002  2
 rbx 0x0000000000000001  1
 rsi 0x0000559beebe0ca0  31 30 31 30 30 30 30 30 31 30 30 31 30 30 31 31  1010000010010011
 rdi 0x000000000000005f  95
 rbp 0x0000000000000001  1
 rsp 0x00007ffdb22578b0  03 00 00 00 00 00 00 00 80 0c be ee 9b 55 00 00  ··········¾î·U··
  r8 0x0000000000000061  97
  r9 0x0000000000000041  65
 r10 0x0000000000000032  50
 r11 0x000000000000003f  63
 r12 0x0000000000000000  0
 r13 0x0000559beebe0c80  70 83 09 71 92 7f 00 00 03 00 00 00 00 00 00 00  p··q············
 r14 0xf000000000000063  17293822569102704739
 r15 0x0000000000000000  0
 rip 0x0000559bee4f1cd0  0f 0b 0f 0b 66 66 66 2e 0f 1f 84 00 00 00 00 00  ····fff.········
 rflags 0x0000000000010202
 cs 0x0033  fs 0x0000  gs 0x0000
 Images (19 omitted):
 Backtrace took 0.49s
*/

// a = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101"
// b = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"

// Int64: 2^63 − 1 for positive integers
// examples exceed Int size


// attempt: compare each bit, add up and check carry value

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        guard !a.isEmpty else { return b }
        guard !b.isEmpty else { return a }

        let arrA = Array(a)
        let arrB = Array(b)

        var result = [Int]()
        var aIndex = arrA.count - 1
        var bIndex = arrB.count - 1
        var carry = 0

        // start index from 2^0 to 2^n
        // num:    1 0 0 0 0 1
        // Index:  0 1 2 3 4 5
        while aIndex >= 0 || bIndex >= 0 || carry != 0 {
            var sum = carry
            
            if aIndex >= 0, arrA[aIndex] == "1" { sum += 1 }
            if bIndex >= 0, arrB[bIndex] == "1" { sum += 1 }

            let digit = sum % 2
            carry = sum / 2

            result.append(digit)

            aIndex -= 1
            bIndex -= 1
        }

        return result.map { String($0) }.reversed().joined()
    }
}
