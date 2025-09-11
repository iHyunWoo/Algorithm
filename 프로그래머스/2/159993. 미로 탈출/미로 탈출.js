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

function isValidMove(maxX, maxY, ny, nx, maps) {
    return ny >= 0 && nx >=0 && ny < maxY && nx < maxX && maps[ny][nx] !== "X"
}

function bfs(maxX, maxY, start, target, maps) {
    const visited = Array.from({length: maxY}, () => Array(maxX).fill(false))
    const queue = new Queue()
    let result = -1
    
    // 상/하/좌/우
    const dy = [-1, 1, 0, 0]
    const dx = [0, 0, -1, 1]
    
    queue.push([...start, 0])
    while (!queue.isEmpty()) {
        const [y, x, depth] = queue.pop()
        
        // 도착했으면 종료
        if (y === target[0] && x === target[1]) {
            result = depth
            break;
        }
        
        for (let i=0; i<4; i++) {
            const ny = y + dy[i]
            const nx = x + dx[i]
            
            if(!isValidMove(maxX, maxY, ny, nx, maps)) {
                // 이동할 수 없는 곳이라면 다음으로
                continue
            }
            
            if(!visited[ny][nx]) {
                visited[ny][nx] = true
                queue.push([ny, nx, depth+1])
            }
        }
    }
    
    return result
}

function solution(maps) {
    const maxY = maps.length
    const maxX = maps[0].length
    
    // 1. 시작/레버/출구 좌표 찾기
    let start = []
    let lever = []
    let end = []
    for (let i=0; i<maxY; i++) {
        for (let j=0; j<maxX; j++) {
            if (maps[i][j] === 'S') {
                start = [i, j]
            } else if (maps[i][j] === 'L') {
                lever = [i, j]
            } else if (maps[i][j] === 'E') {
                end = [i, j]
            }
        }
    }
    
    // 2. 레버 찾기
    const leverResult = bfs(maxX, maxY, start, lever, maps)
    
    // 3. 출구 찾기
    const endResult = bfs(maxX, maxY, lever, end, maps)
    
    return (leverResult === -1 || endResult === -1) ? -1 : (leverResult + endResult);
}

