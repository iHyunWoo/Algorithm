import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var progresses = progresses
    var speeds = speeds
    
    while !progresses.isEmpty {
        // 현재 진행 속도를 더함
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
        
        var count: Int = 0
        // 완료된 태스크는 넘는건 제거
        while progresses.count > 0 && progresses[0] >= 100 {
            count += 1
            progresses.removeFirst()
            speeds.removeFirst()
        }
        
        if count > 0 {
            result.append(count)
        }

    }
    
    return result
}