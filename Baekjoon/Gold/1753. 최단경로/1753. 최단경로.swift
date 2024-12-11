import Foundation

// 하나의 Vertex에서 각 Vertex로 최단 거리 구하기
// "Single source all destinations shorted path"

// Dijkstra's Shortest Path

// Greedy: 현재까지 파악된 최단 경로 확정, 이를 활용해 다음 최단 경로 탐색
// 가장 짧은 거리부터 무조건 시작

// 1. 시작 정점에서 각 정점까지의 거리 저장한 배열 구성

// 2. 시작 정점의 거리는 0, 다른 모든 정점의 거리는 INF (무한)

// 3. 우선순위 큐 활용, 현재 정점에서 가장 짧은 거리 가지는 정점 선택하기
// 우선순위: 가중치 (가장 짧은 거리)
// 꺼낸 정점이 이미 처리된 정점: 무시 (최소 거리보다 작을 수 없음)

// 선택된 정점과 연결된 모든 인접 정점 거리 계산
// 새롭게 계산된 거리가 기존 거리보다 작은 경우: 거리 값 갱신, 큐에 추가 (이후 인접 정점 체크할 필요 있음)

// 4. 선택된 정점 기준으로 계속해서 인접한 정점들의 최단 거리 갱신
// 큐가 비거나 (더 이상 체크할 필요있는 정점 없음) 모든 정점의 최단 경로가 확보될 때까지


// 가중치가 양수일 때만 활용 가능
// 음수: Bellman-Ford 활용해야 함


// 인접 리스트 활용해서 구하기


// 우선순위 큐를 위한 Heap 구조체
struct Heap<T> {
    var nodes = [T]()
    let comparer: (T, T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func enqueue(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        // 내림차순 정렬
        while index > 0, !comparer(nodes[(index - 1) / 2], nodes[index]) {
            nodes.swapAt((index - 1) / 2, index)
            
            // 부모 Nodedml index 구하기 (완전 이진 트리 속성)
            // while 활용: 계속해서 위로 이동
            index = (index - 1) / 2
        }
    }
    
    mutating func dequeue() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 { return nodes.removeFirst() }
        
        let result = nodes[0]
        nodes[0] = nodes.removeLast()
        
        // root에서 시작
        var index = 0
    
        while index * 2 + 1 < nodes.count {
            var smallerChildIndex = index * 2 + 1
            
            // index * 2 + 1: 왼쪽 자식 노드
            // index * 2 + 2: 오른쪽 자식 노드
            if index * 2 + 2 < nodes.count && comparer(nodes[index * 2 + 2], nodes[index * 2 + 1]) {
                smallerChildIndex = index * 2 + 2
            }
            if comparer(nodes[smallerChildIndex], nodes[index]) {
                nodes.swapAt(index, smallerChildIndex)
                index = smallerChildIndex
            } else { break }
        }
        
        return result
    }
}

// 간선 정보를 저장할 구조체
struct Edge: Comparable {
    let dest: Int
    let weight: Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

// 다익스트라 알고리즘 함수
func dijkstra(from: Int, V: Int, graph: [[(Int, Int)]]) -> [Int] {
    // INF: 무한 표현 (접근 방법 없음 의미)
    // 시작 정점에서 각 정점까지의 최단 거리 저장 배열
    // index가 해당 노트 가리키도록 1개 더 생성 (0번 제외하기)
    var dist = [Int](repeating: Int.max, count: V + 1)
    
    // 자기 자신
    dist[from] = 0
    
    var pq = Heap<Edge>(comparer: <)
    // 자기 자신 시작점 설정
    pq.insert(Edge(dest: from, weight: 0))
    
    // 인접 거리 정보 체크해볼 필요있는 정점과 시작점에서 해당 정점까지의 체크하는 시점의 최단 거리 정보
    while let current = pq.dequeue() {
        let (node, weight) = (current.dest, current.weight)
        
        // 해당 최단 거리가 항상 최단 거리를 저장하는 배열의 값보다 크면 무시 (체크할 필요 없음, 이미 체크한 곳이면 작을 수 없음)
        if weight > dist[node] { continue }
        
        // 해당 정점에서 연결된 모든 간선 확인
        // nextNode: 현재 간선의 목적지 (정점 연결된 다음 목적지)
        for (nextNode, nextWeight) in graph[node] {
            // 체크 시점의 최단 거리 + 다음 목적지까지의 간선 거리
            let newWeight = weight + nextWeight
            
            // 해당 목적지로의 거리가 항상 최단 거리를 저장하는 배열의 값보다 작으면 새로운 최단 거리로 update
            if newWeight < dist[nextNode] {
                dist[nextNode] = newWeight
                // 새로운 최단 거리와 목적지를 우선순위 큐에 추가, 이후 pq.dequeue로 해당 목적지에 연결된 간선들(그 다음 목적지와 거리)을 탐색하기 위함
                pq.enqueue(Edge(dest: nextNode, weight: newWeight))
            }
        }
    }
    
    return dist
}

// 입력 처리
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (V, E) = (firstLine[0], firstLine[1])
let K = Int(readLine()!)!

// 간선 및 목적지 정보 저장
var graph = [[(Int, Int)]](repeating: [], count: V + 1)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, w) = (input[0], input[1], input[2])
    graph[u].append((v, w))
}

// 다익스트라 알고리즘 실행
let result = dijkstra(from: K, V: V, graph: graph)

// 결과 출력
// 1번 노드부터 시작 (0번 제외)
for i in 1...V {
    if result[i] == Int.max {
        print("INF")
    } else {
        print(result[i])
    }
}

// 예제 풀이

// 시작점: 1

// 결과 배열: [INF, INF, INF, INF, INF, INF]
// 큐: []

// 큐에 (0, 1) 저장 // 거리, 목적지
// 배열 update: [INF, 0, INF, INF, INF, INF]
// 큐: [(0, 1)]

// 큐에서 (0, 1) 제거, 1에 연결된 edge 확인: (2, 2), (3, 3)
// 큐: []

// (2, 2) 확인: 큐에 저장
// 배열 update: [INF, 0, 2, INF, INF, INF]
// 큐: [(2, 2)]

// (3, 3) 확인: 큐에 저장
// 배열 update: [INF, 0, 2, 3, INF, INF]
// 큐: [(2, 2), (3, 3)]

// 큐에서 (2, 2) 제거, 2에 연결된 edge 확인: (4, 3), (5, 4)
// (4, 3) 확인: 2 + 4 > 3 이므로 무시
// 큐: [(3, 3)]

// (5, 4) 확인: 큐에 저장, 거리: 2 + 5
// 배열 update: [INF, 0, 2, 3, 7, INF]
// 큐: [(3, 3), (7, 4)]

// 큐에서 (3, 3) 제거, 3에 연결된 edge 확인: (6, 4)
// (6, 4) 확인: 3 + 6 > 2 + 5 이므로 무시
// 큐: [(7, 4)]

// 큐에서 (7, 4) 제거, 4에 연결된 간선 확인, 없음
// 큐: []
// 큐가 비었으므로 종료
