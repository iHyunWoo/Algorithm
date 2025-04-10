import Foundation

let n = Int(readLine()!)!
var apt: [[Int]] = []

for _ in 0..<n {
  let line = readLine()!.compactMap {$0.wholeNumberValue}
  apt.append(line)
}

var isVisited = Array(repeating: Array(repeating: false, count: n), count: n)

// 집이 없는 곳은 방문처리
for i in 0..<n {
  for j in 0..<n {
    if apt[i][j] == 0 {
      isVisited[i][j] = true
    }
  }
}

var count: Int = 0
func dfs(_ x: Int, _ y: Int) {
  // 방문 했다면 리턴
  if isVisited[x][y] { return }
  
  isVisited[x][y] = true
  count += 1
  
  if x > 0 {
    dfs(x-1, y)
  }
  if y > 0 {
    dfs(x, y-1)
  }
  if x < n-1 {
    dfs(x+1, y)
  }
  if y < n-1 {
    dfs(x, y+1)
  }
}

var result: [Int] = []

for i in 0..<n {
  for j in 0..<n {
    dfs(i, j)
    if count != 0 {
      result.append(count)
      count = 0
    }
  }
}

result.sort()
print(result.count)
result.forEach { print($0) }
