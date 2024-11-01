import Foundation

// 1. yellow의 두 개의 곱으로 나타 낼 수 있는 모든 경우의 수를 찾음(단 가로가 더 길거나 같음)
// ex) 6 -> (3x2), (6x1)
// 2. 각 경우의 수에서 가로 세로를 +2 씩 해줌(갈색 테두리 더하기)
// ex) (5x3), (8x3)
// 3. +2해주고 곱 연산을 해준 값에서 yellow을 빼서 brown과 같은 경우의 수를 찾음
// ex) (5x3) - 6 = 11, (8x3) - 6 = 18

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // [가로, 세로] 배열
    var options: [[Int]] = []
    
    // 예외: yellow가 1이라면 바로 리턴
    if yellow == 1 {
        let side = Int(sqrt(Double(brown+1)))
        return [side, side]
    }
    
    // 1
    for i in 1...yellow/2 {
        if yellow % i == 0 {
            options.append([max(i, yellow/i) + 2, min(i, yellow/i) + 2]) // 2
        }
    }
    
    // 3
    for option in options {
        if option[0]*option[1] - yellow == brown {
            return option    
        }
    }

    return []
}
