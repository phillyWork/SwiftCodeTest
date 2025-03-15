import Foundation

// stack 활용, 1231을 구성할 때마다 pop

// 첫 시도: suffix 활용 마지막 4개의 element 뽑아서 1231 여부 확인
// 에러 사항: 시간 초과
// suffix 메서드 활용, 매번 새로운 배열 생성

func solution(_ X:String, _ Y:String) -> String {
    var stack: [Int] = []
    var count = 0
    
    for num in ingredient {
        stack.append(num)
        
        // 스택의 마지막 4개 요소가 [1, 2, 3, 1]인지 확인
        if stack.count >= 4 &&
            stack.suffix(4) == [1, 2, 3, 1] {
            // 패턴을 찾았으면 pop으로 제거
            stack.removeLast(4)
            count += 1
        }
    }
    
    return count
}

// 해결: 마지막 4개의 요소가 1231이 되면 pop하기

func solution(_ X:String, _ Y:String) -> String {
    var stack: [Int] = []
        var count = 0
        
        for num in ingredient {
            stack.append(num)
            
            // 스택의 마지막 4개가 [1, 2, 3, 1]인지 직접 확인 (O(1) 연산)
            if stack.count >= 4 &&
               stack[stack.count - 4] == 1 &&
               stack[stack.count - 3] == 2 &&
               stack[stack.count - 2] == 3 &&
               stack[stack.count - 1] == 1 {
                // 패턴 발견 → 제거
                stack.removeLast(4)
                count += 1
            }
        }
        
        return count
}
