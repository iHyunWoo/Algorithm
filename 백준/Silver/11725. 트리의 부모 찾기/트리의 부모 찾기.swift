import Foundation

let nodeCount = Int(readLine()!)!
var matrix: [Int: [Int]] = [:]

for _ in 0..<nodeCount-1 {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  matrix[line[0], default: []].append(line[1])
  matrix[line[1], default: []].append(line[0])
}

var result: [Int] = Array(repeating: 0, count: nodeCount + 1)
var isVisited: [Bool] = Array(repeating: false, count: nodeCount + 1)
func dfs(_ node: Int) {
  for childNode in matrix[node] ?? [] {
    if !isVisited[childNode] {
      isVisited[childNode] = true
      result[childNode] = node
      dfs(childNode)
    }
  }
}

isVisited[1] = true
dfs(1)

for i in 2..<result.count {
  print(result[i])
}