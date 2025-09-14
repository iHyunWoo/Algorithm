class Queue {
    items = []
    front = 0
    rear = 0
    
    push(item) {
        this.items.push(item)
        this.rear++
    }
    
    pop() {
        return this.items[this.front++]
    }
    
    isEmpty() {
        return this.front === this.rear
    }
}

function solution(maps) {
    // 너비 우선 탐색
    const queue = new Queue()
    let answer = -1
    const maxY = maps.length
    const maxX = maps[0].length
    
    // 큐에 초기값 넣기
    queue.push([0, 0, 1])
    maps[0][0] = 0
    while (!queue.isEmpty()) {
        const [y, x, step] = queue.pop()
        // 끝에 도달했으면 중지
        if (y === maxY-1 && x === maxX-1) {
            answer = step
            break
        }
        
        // 주변의 벽이 아닌 곳을 큐에 추가
        // 상/하/좌/우
        const dy = [1, -1, 0, 0]
        const dx = [0, 0, -1, 1]
        for (let i=0; i<dy.length; i++) {
            const ny = y + dy[i]
            const nx = x + dx[i]
            
            if (
                nx >= 0 && ny >= 0 
                && ny < maxY
                && nx < maxX
                && maps[ny][nx] !== 0
            ) {
                queue.push([ny, nx, step+1])
                // 해당 위치를 벽으로 바꿈(방문처리)
                maps[ny][nx] = 0
            }
        }
    }
    
    return answer;
}
