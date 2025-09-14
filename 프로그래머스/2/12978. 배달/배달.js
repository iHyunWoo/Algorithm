class PriorityQueue {
    items = []
    
    push(item, priority) {
        this.items.push({item, priority})
        this.sort()
    }
    
    pop() {
        return this.items.shift()
    }
    
    sort() {
        this.items.sort((a, b) => {
            return a.priority - b.priority
        })        
    }
    
    size() {
        return this.items.length
    }
}

function solution(N, road, K) {
    const graph = Array.from({length: N+1}, () => [])
    
    const queue = new PriorityQueue()
    const distance = Array.from({length: N+1}, () => Infinity)
    
    // 그래프 세팅
    for (const [from, to, weight] of road) {
        graph[from].push({ next: to, weight })
        graph[to].push({ next: from, weight })
    }
    
    // 다익스트라
    // 시작 노드 자기 자신의 거리는 0
    distance[1] = 0
    queue.push(1, 0)
    
    while(queue.size() > 0) {
        const {item, priority} = queue.pop()
        
        for (const {next, weight} of graph[item]) {
            const newWeight = distance[item] + weight
            if (newWeight < distance[next]) {
                // 더 짧은 거리가 가능하다면
                distance[next] = newWeight
                queue.push(next, newWeight)
            }
        }
    }
    
    // 개수 세기
    let answer = 0
    for (const dist of distance) {
        if (dist <= K) answer++
    }

    return answer;
}