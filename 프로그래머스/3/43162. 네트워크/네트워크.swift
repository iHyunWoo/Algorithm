import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: computers.count)
    var count: Int = 0
    
    func dfs(_ computer: Int) {
        visited[computer] = true
        
        for i in 0..<n {
            if computers[computer][i] == 1 && !visited[i] {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            count += 1
            dfs(i)
        }
    }
    
    
    return count
}