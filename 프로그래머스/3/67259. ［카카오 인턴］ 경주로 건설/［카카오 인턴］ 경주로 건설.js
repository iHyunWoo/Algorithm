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

function isValidMove(x, y, N, board) {
    return x >= 0 && y >= 0 && x < N && y < N && board[y][x] === 0
}

function calcCost(prevDirection, newDirection, cost) {
    if (prevDirection === -1 || prevDirection === newDirection) {
        return cost + 100
    } else {
        return cost + 600
    }
}

function solution(board) {
    const N = board.length
    // 상/하/좌/우
    const directions = [
        [0, -1], 
        [0, 1],
        [-1, 0], 
        [1, 0]
    ]
    
    // [x좌표, y좌표, 방향index, cost]
    const queue = new Queue()
    const visited = Array.from({ length: N }, () => {
        return Array.from({ length: N }, () => Array(4).fill(Infinity))
    })
    let answer = Infinity
    
    // 방향이 안 정해졌으니 -1
    queue.push([0, 0, -1, 0])
    
    while (!queue.isEmpty()) {
        const [x, y, prevDirection, cost] = queue.pop()
        
        if(x === N - 1 && y === N - 1) {
            answer = Math.min(answer, cost)
        }
        
        // 가능한 방향 탐색
        for (let i = 0; i < directions.length; i++) {
            const [dx, dy] = directions[i]
            const nx = dx + x
            const ny = dy + y
            
            // 이동 불가능한 칸이라면 스킵
            if (!isValidMove(nx, ny, N, board)) continue
            
            
            // 새로운 비용 계산
            const newCost = calcCost(prevDirection, i, cost)
            
            // 더 저렴하게 방문할 수 있는 경우만 큐 업데이트
            if (visited[ny][nx][i] > newCost) {
                visited[ny][nx][i] = newCost
                queue.push([nx, ny, i, newCost])
            }  
        }
    }
    
    return answer;
}

