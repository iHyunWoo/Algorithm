// class PriorityQueue {
//     // 임시 sort 함수를 이용한 큐. 후에 Heap으로 교체
//     items = []
    
//     push(item) {
//         this.items.push(item)
//         this.sort()
//     }
    
//     pop() {
//         return this.items.pop()
//     }
    
//     sort() {
//         this.items.sort((a, b) => b.cost - a.cost)  // 내림차순 정렬 -> height 낮은(우선순위 높은)이 마지막으로
//     }
    
//     size() {
//         return this.items.length
//     }
// }

class PriorityQueue {
    // 임시 sort 함수를 이용한 큐. 후에 Heap으로 교체
    items = []
    
    push(item) {
        this.items.push(item)
        this.bubbleUp()
    }
    
    pop() {
        if (this.size() === 0) return null
        
        const minValue = this.items[0]
        this.items[0] = this.items[this.size() - 1]
        this.items.pop()
        this.bubbleDown()
        return minValue
    }
    
    bubbleUp() {
        let current = this.size() - 1
        while(current > 0) {
            const parent = this.getParent(current)
            if (this.items[current].cost >= this.items[parent].cost) {
                break
            }
            this.swap(parent, current)
            current = parent
        }
    }
    
    bubbleDown() {
        let current = 0
        // 자식이 존재하는 동안 반복
        while (this.getLeft(current) < this.size()) {
            const left = this.getLeft(current)
            const right = this.getRight(current)
            const smaller = 
                right < this.size()  // 오른쪽 자식이 있고
                && this.items[right].cost < this.items[left].cost  // 오른쪽이 더 작다면
                ? right
                : left
            
            if (this.items[current].cost <= this.items[smaller].cost) {
                break
            }
            
            this.swap(smaller, current)
            current = smaller
        }
    }
    
    swap(a, b) {
        [this.items[a], this.items[b]] = [this.items[b], this.items[a]]
    }
    
    size() {
        return this.items.length
    }
    
    getParent(i) {return Math.floor((i - 1) / 2)}
    getLeft(i) {return i * 2 + 1}
    getRight(i) {return i * 2 + 2}
}

function isValidMove(row, col, N) {
    return row >= 0 && col >= 0 && row < N && col < N
}

function solution(land, height) {
    // BFS 탐색
    // 우선순위 큐를 사용해서, 현재 큐에 있는 땅 중 가장 낮은 곳으로 
    // 만약 현재 칸과 이동한 칸의 높이차가 height 이상이면 사다리 설치.
    const N = land.length
    let answer = 0;
    // 상하좌우
    const moves = [
        [-1, 0],
        [1, 0], 
        [0, -1],
        [0, 1]
    ]
    const pq = new PriorityQueue()
    const visited = Array.from({length: N}, () => Array.from({length: N}, () => false))
    
    pq.push({row: 0, col: 0, cost: 0})
    
    while (pq.size() > 0) {
        const {row, col, cost} = pq.pop()
        if (visited[row][col]) continue;
        
        // 방문처리
        visited[row][col] = true

        answer += cost
        
        for (const [dy, dx] of moves) {
            const ny = row + dy
            const nx = col + dx
            if (isValidMove(ny, nx, N)) {
                const heightDiff = Math.abs(land[ny][nx] - land[row][col])
                // height 차가 크다면 사다리 두기
                const newCost = heightDiff <= height ? 0 : heightDiff
                pq.push({row: ny, col: nx, cost: newCost})
            }
        }
        
    }
    
    
    return answer;
}
