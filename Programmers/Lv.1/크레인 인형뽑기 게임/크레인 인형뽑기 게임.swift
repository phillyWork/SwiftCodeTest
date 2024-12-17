import Foundation

// 아이디어 과정 정리

// 주어진 board: 단순 N X N 배열을 가로 기준으로 자른 것
// 실제 작업: 세로 배열마다 구분해서 작업

// 세로 배열로 이루어진 board로 재구성하기

// 바구니에서 터트려 사라진 인형 개수 구하기
// 터트림 조건: 위에서만 내려오는 인형 동일함 체크
// 바구니: FILO 이므로 스택 구조로 해결하기

// 스택: 동일함 체크 --> 굳이 스택에 넣었다 다시 뺄 필요 없이 함수로 체크해서
// true면 pop, false면 push하도록 구성하기

struct Stack {
    private var top = 0
    private var array = [Int]()
    
    func checkBomb(_ input: Int) -> Bool {
        if array.isEmpty {
            return false
        } else {
            return array[top] == input
        }
    }
    
    mutating func push(_ input: Int) {
        array.insert(input, at: top)
        top += 1
    }
    
    mutating func pop() {
        array.remove(at: top)
        top -= 1
    }
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var boardsInVertical = Array(repeating: Array(repeating: 0, count: board.count), count: board.count)
    
    // 세로 배열 구성하기
    for index in 0..<board.count {
        for i in 0..<board.count {
            boardsInVertical[i][index] = board[index][i]
        }
    }
    
    var stack = Stack()
    var result = 0
    
    for move in moves {
        for i in 0..<board.count {
            if boardsInVertical[move-1][i] != 0 {
                if stack.checkBomb(boardsInVertical[move-1][i]) {
                    stack.pop()
                    result += 2
                } else {
                    stack.push(boardsInVertical[move-1][i])
                }
                // 빼낸 인형 위치는 0으로 만들기
                boardsInVertical[move-1][i] = 0
            }
        }
    }
    
    return result
}


// 오류사항
// core dumped 에러 발생

// 1. stack에서 top 활용
// index out of range 오류 가능성

// 2. 0값까지 모두 추가하면서 필요없는 연산량 증가
// 2차원 배열 중첩 for문 순회해야 하므로 연산량 급증




// 해결

// 1. top을 index로 활용하는 대신 sequence의 메서드 활용하기
// insert 대신 append
// remove 대신 removeLast

struct Stack {
    private var array = [Int]()
    
    func checkBomb(_ input: Int) -> Bool {
        return array.last == input
    }
    
    mutating func push(_ input: Int) {
        array.append(input)
    }
    
    mutating func pop() {
        array.removeLast()
    }
}


// 2. 0값 없이 실제 값만 활용하기
// 0: 지나감 <--> 실제 값이 있을때만 stack과 비교해서 체크
// 세로 배열 실제 값으로만 구성한 것에서 move에 해당하는 배열의 첫번째 값부터 연산

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    // 1. 세로 방향 배열로 변환
    var boardsInVertical = Array(repeating: [Int](), count: board[0].count)
    
    for row in board {
        for (index, value) in row.enumerated() {
            if value != 0 { // 0이 아닌 값만 추가
                boardsInVertical[index].append(value)
            }
        }
    }
    
    var stack = Stack()
    var result = 0
    
    // 2. moves 처리
    for move in moves {
        let column = move - 1 // moves는 1부터 시작하므로 -1 필요
        
        // 비어있다면 연산 할 필요 없음
        if !boardsInVertical[column].isEmpty {
            
            // 세로 배열 중 맨 위 위치한 인형 빼내기
            let pickedDoll = boardsInVertical[column].removeFirst()
            
            if stack.checkBomb(pickedDoll) {
                stack.pop()
                result += 2 // 두 개가 터지므로 +2
            } else {
                stack.push(pickedDoll)
            }
        }
    }
    
    return result
}



// 참고: top을 활용해서 작성하려는 경우

struct Stack {
    private var top = -1 // 스택이 비어있을 때 -1로 초기화
    private var array = [Int]()
    
    var isEmpty: Bool {
        return top == -1
    }
    
    func peek() -> Int? {
        return isEmpty ? nil : array[top]
    }
    
    // 가장 맨 위의 element와 input 비교 시
    // 우선 비어있는지 여부 확인, 그 후 element와 input 비교
    func checkBomb(_ input: Int) -> Bool {
        guard let lastItem = peek() else { return false }
        return lastItem == input
    }
    
    // array 크기에 비해 아직 비어있다면 직접 index로 input값 넣기
    // 규격 벗어나면 append 메서드로 내부적으로 array 크기 늘린 후, input 삽입
    mutating func push(_ input: Int) {
        top += 1
        if top < array.count {
            array[top] = input
        } else {
            array.append(input)
        }
    }
    
    // pop한 결과물을 따로 활용하지 않으므로
    // 비어있지 않다면 top만 -1 해줌
    mutating func pop() {
        if !isEmpty {
            top -= 1
        }
    }
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boardsInVertical = Array(repeating: [Int](), count: board[0].count)
    
    // board.reveresed 활용, 맨 마지막 element 부터 넣기
    
    // e.g.) [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
    // row: [0, 2, 5, 0, 1] --> [1, 0, 5, 2, 0]
    // append 결과: [1, 5, 2]
    
    for row in board.reversed() { // 아래에서부터 위로 쌓기
        for (index, value) in row.enumerated() {
            if value != 0 {
                boardsInVertical[index].append(value)
            }
        }
    }
    
    var stack = Stack()
    var result = 0
    
    for move in moves {
        let column = move - 1
        
        if !boardsInVertical[column].isEmpty {
            
            // append 결과: [1, 5, 2]
            // 실제: [2, 5, 1] 순서
            // 가장 맨 아래: 가장 맨 처음 값
            let pickedDoll = boardsInVertical[column].removeLast()
            
            if stack.checkBomb(pickedDoll) {
                stack.pop()
                result += 2
            } else {
                stack.push(pickedDoll)
            }
        }
    }
}



// Stack 외에 직접 처리하기
// 별도의 함수 호출, 데이터 타입 활용 없이 작성 (코드 직관성 높음)

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var count = 0
    var stacks: [[Int]] = Array(repeating: [], count: board.count)
    var bucket: [Int] = []
    
    // reversed 활용: Array의 popLast 활용하기 목적 (popFirst 존재하지 않음)
    
    // popLast vs. removeLast
    // popLast: return element?
    // removeLast: return element
    
    // removeLast: element 없다면 에러 발생
    
    board.reversed().forEach {
        $0.enumerated().forEach {
            if $0.1 != 0 {
                stacks[$0.0].append($0.1)
            }
        }
    }
    
    moves.forEach {
        // 각 move 당 빼올 인형
        if let doll = stacks[$0-1].popLast() {
            if let last = bucket.last, last == doll {
                bucket.removeLast(1)
                count += 2
            } else {
                bucket.append(doll)
            }
        }
    }
    
    return count
}
