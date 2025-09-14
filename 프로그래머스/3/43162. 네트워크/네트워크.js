function solution(n, computers) {
    let answer = 0;
    const visited = new Set()
    
    for (let i=0; i<n; i++) {
        // 방문한 컴퓨터라면 다음으로
        if (visited.has(i)) continue;
        visited.add(i)
        answer++
        dfs(computers, visited, i)
    }
    
    return answer;
}

function dfs(computers, visited, i) {
    const adjComputers = computers[i]
    
    for (const [index, value] of adjComputers.entries()) {
        // 방문 했다면 다음으로
        if (visited.has(index) || value === 0) continue;
        // 방문처리하고 재귀호출
        visited.add(index)
        dfs(computers, visited, index)
    }
}