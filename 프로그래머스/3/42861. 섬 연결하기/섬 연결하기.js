function find(parents, x) {
    if (parents[x] === x) {
        return x
    }
    // 경로 압축
    parents[x] = find(parents, parents[x])
    
    return parents[x]
}

function union(parents, x, y) {
    const root1 = find(parents, x)
    const root2 = find(parents, y)
    
    parents[root2] = root1
}

function solution(n, costs) {
    const sortedCosts = costs.sort((a, b) => {
        return a[2] - b[2]
    })
    // 각 노드의 루트노드는 본인(모두 독립적인 노드)
    const parents = Array.from({length: n}, (_, i) => i)
    // 간선의 수
    let edgeCount = 0
    let answer = 0
    
    for (const cost of sortedCosts) {
        // 간선의 수가 n-1이면 종료
        if (edgeCount === n - 1) break
        
        const x = find(parents, cost[0])
        const y = find(parents, cost[1])
        
        if (x !== y) {
            // 두 루트 노드가 다르다면, union
            union(parents, x, y)
            answer += cost[2]
            edgeCount++
        }
    }
    
    return answer;
}