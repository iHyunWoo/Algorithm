import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var count: Int = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    
    func dfs(_ index: Int) {
        let currentNetwork = computers[index]
        
        for i in 0..<n {
            if currentNetwork[i] == 1 && !visited[i] {
                visited[i] = true
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(i)
            count += 1
        }
    }
    
    return count
}