import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    
    var sortedA: [Int] = A.sorted(by: {$0 < $1})  // 오름차순 정렬
    var sortedB: [Int] = B.sorted(by: {$0 > $1})  // 내림차순 정렬
    
    for i in sortedA.indices {
        ans += sortedA[i] * sortedB[i]
    }

    return ans
}