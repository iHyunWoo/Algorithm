import Foundation

let n = Int(readLine()!)!

var board: [[Int]] = []
for _ in 0..<n {
  board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
dp[0][0] = 1

for y in 0..<n {
  for x in 0..<n {
    if y >= n-1 && x >= n-1 { continue }
    let currentJump = board[y][x]
    
    if y + currentJump < n {
      dp[y + currentJump][x] += dp[y][x]
    }
    
    if x + board[y][x] < n {
      dp[y][x + currentJump] += dp[y][x]
    }
  }
}

print(dp[n - 1][n - 1])



// MARK: - DFS 풀이 - 시간 초과

//let n = Int(readLine()!)!
//
//var board: [[Int]] = []
//for _ in 0..<n {
//  board.append(readLine()!.split(separator: " ").map { Int($0)! })
//}
//
//typealias Position = (x: Int, y: Int)
//
//var result = 0
//func dfs(_ current: Position) {
//  if current.x == n - 1 && current.y == n - 1 {
//    result += 1
//    return
//  }
//  
//  let currentJump = board[current.x][current.y]
//  
//  if current.x + currentJump < n {
//    dfs((x: current.x + currentJump, y: current.y))
//  }
//  
//  if current.y + currentJump < n {
//    dfs((x: current.x, y: current.y + currentJump))
//  }
//}
//
//dfs((x: 0, y: 0))
//
//print(result)
