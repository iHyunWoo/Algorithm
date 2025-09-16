function dfs(remainHP, step, dungeons, visited) {
    let maxCount = step
    for (const [i, dungeon] of dungeons.entries()) {
        // 현재 피로도가 최소 피로도 이상, 방문 안했다면 방문
        if (remainHP >= dungeon[0] && !visited[i]) {
            visited[i] = true
            const count =  dfs(remainHP - dungeon[1], step+1, dungeons, visited)
            maxCount = Math.max(maxCount, count)
            // 백트래킹
            visited[i] = false
        }
    }
    
    
    return maxCount
}

function solution(k, dungeons) {
    const visited = Array(dungeons.length).fill(false)
    const answer = dfs(k, 0, dungeons, visited)
    return answer;
}