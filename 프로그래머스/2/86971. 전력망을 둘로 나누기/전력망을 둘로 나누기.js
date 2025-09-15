// 1번 노드부터 dfs탐색 후 개수 리턴
function dfs(graph) {
    const visited = Array.from({length: graph.length}, () => false)
    visited[0] = true  // 빈 공간
    visited[1] = true   // 1부터 시작
    const stack = [...graph[1]]
    let count = 1
    
    while(stack.length > 0) {
        const node = stack.pop()
        count++
        visited[node] = true
        
        const adjNodes = graph[node]
        for (const adjNode of adjNodes) {
            if (!visited[adjNode]) {
                stack.push(adjNode)
            }
        }
    }
    
    return count
}

function solution(n, wires) {
    const graph = Array.from({length: n+1}, () => [])
    for (const wire of wires) {
        graph[wire[0]].push(wire[1])
        graph[wire[1]].push(wire[0])
    }
    
    let answer = Number.MAX_VALUE
    
    for (const [a, b] of wires) {
        // 간선 제거
        graph[a].splice(graph[a].indexOf(b), 1)
        graph[b].splice(graph[b].indexOf(a), 1)
        
        // count 계산
        const countA = dfs(graph)
        const countB = n - countA
        
        // 최소값 비교
        answer = Math.min(answer, Math.abs(countA - countB))
        
        // 간선 복원
        graph[a].push(b)
        graph[b].push(a)
    }
    
    return answer;
}