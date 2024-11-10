import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // words에 target이 없는경우 리턴
    guard words.contains(target) else { return 0 }
    
    var visited: [Bool] = Array(repeating: false, count: words.count)
    var queue: [String] = []
    var ans: Int = 0
    
    queue.append(begin)
    
    // bfs 탐색
    while !queue.isEmpty {
        let current = queue.removeLast()
        
        if current == target {
            break
        }
        
        ans += 1
        
        for i in words.indices {
            if !visited[i] && diffOneChar(current, words[i]) {
                queue.append(words[i])
                visited[i] = true
            }
        }
    }
    
    return ans
}

// 두 문자열을 비교해서 한글자만 다른지 비교하는 함수
func diffOneChar(_ s1: String, _ s2: String) -> Bool {
    
    let chars1 = Array(s1)
    let chars2 = Array(s2)
    var diffCount = 0
    
    for (c1, c2) in zip(chars1, chars2) {
        if c1 != c2 {
            diffCount += 1
            
            if diffCount > 1 {
                return false
            }
        }
    }
    
    return diffCount == 1
    
}