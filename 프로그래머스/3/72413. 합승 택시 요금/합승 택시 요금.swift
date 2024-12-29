import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var adjList: [Int: [(Int, Int)]] = [:]
    // 인접 리스트로 변환
    for fare in fares {
        let node1 = fare[0]
        let node2 = fare[1]
        let weight = fare[2]
        
        adjList[node1, default: []].append((node2, weight))
        adjList[node2, default: []].append((node1, weight))
    }
    
    // S, A, B 각각에서 출발하는 최단 거리를 각각 구하고, 
    // 그 3개의 배열을 합쳐서 나오는 최솟값이 경유지점(둘이 갈라지는)
    var sDijkstra = dijkstra(n: n, start: s, adjList: adjList)
    var aDijkstra = dijkstra(n: n, start: a, adjList: adjList)
    var bDijkstra = dijkstra(n: n, start: b, adjList: adjList)

    var totalDijkstra: [Int] = []
    for i in 0..<sDijkstra.count {
        let total = sDijkstra[i] + aDijkstra[i] + bDijkstra[i]
        totalDijkstra.append(total)
    }
    
    return totalDijkstra.min()!
}

// 다익스트라 알고리즘을 통해 start node로 각 node까지의 최단 거리 배열 리턴
// n - 노드의 수
// start - 시작 노드 번호
// adjList - 인접리스트(key: 기준노드번호, value: (이어진노드번호, 거리))
func dijkstra(n: Int, start: Int, adjList: [Int: [(Int, Int)]]) -> [Int] {
    let inf = 20000001
    
    var distance = Array(repeating: inf, count: n+1)
    var visited = Array(repeating: false, count: n+1)
    
    // 시작 노드의 거리는 0
    distance[start] = 0
    // 0번 노드는 존재하지 않으니 방문처리
    visited[0] = true
    
    while true {
        var minDistance = inf
        var minNode = -1
        
        for node in 1...n {
            if !visited[node] && distance[node] < minDistance {
                minDistance = distance[node]
                minNode = node
            }
        }
        
        // 방문 가능한 노드가 없으면 리턴
        if minNode == -1 {
            break
        }
        
        visited[minNode] = true
        
        if let neighbors = adjList[minNode] {
            for (neighbor, weight) in neighbors {
                if !visited[neighbor] && (distance[minNode] + weight < distance[neighbor]) {
                    distance[neighbor] = distance[minNode] + weight
                }
            }
        }
    }
    
    return distance
}