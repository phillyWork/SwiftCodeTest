import Foundation

// 가로 길이 M을 1로 만드는 횟수: M−1
// M개의 1*N 종이에서 세로 길이 N을 1로 만드는 횟수: M * (N−1)
// M−1 + M(N−1) = M−1 + MN − M = MN − 1

func solution(_ M:Int, _ N:Int) -> Int {
    return M*N - 1
}
