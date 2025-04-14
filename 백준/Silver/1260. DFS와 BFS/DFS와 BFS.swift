import Foundation

let firstLine = readLine()!.split(separator: " ").map {Int($0)!}
let n = firstLine[0]
let m = firstLine[1]
let v = firstLine[2]

// key -> value 그래프
var graph: [Int: [Int]] = [:]

for _ in 0..<m {
  let line = readLine()!.split(separator: " ").map {Int($0)!}
  let start = line[0]
  let end = line[1]
  graph[start, default: []].append(end)
  graph[end, default: []].append(start)
}

// value 정렬
graph = graph.mapValues { $0.sorted() }

// MARK: - DFS
var visited: [Bool] = Array(repeating: false, count: n+1)
visited[v] = true

var dfsResult: [Int] = [v]
func dfs(_ node: Int) {
  let neighborNodes: [Int] = graph[node] ?? []
  
  for nNode in neighborNodes {
    if !visited[nNode] {
      visited[nNode] = true
      dfsResult.append(nNode)
      dfs(nNode)
    }
  }
}

dfs(v)
print(dfsResult.map { String($0) }.joined(separator: " "))

// MARK: - BFS
visited = Array(repeating: false, count: n+1)
visited[v] = true

var bfsResult: [Int] = [v]
var queue: [Int] = [v]

while !queue.isEmpty {
  let currentNode = queue.removeFirst()
  let neighborNodes: [Int] = graph[currentNode] ?? []
  
  for nNode in neighborNodes {
    if !visited[nNode] {
      visited[nNode] = true
      bfsResult.append(nNode)
      queue.append(nNode)
    }
  }
}

print(bfsResult.map { String($0) }.joined(separator: " "))
