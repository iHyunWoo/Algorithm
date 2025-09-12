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

function buildTree(info, edges) {
    const tree = Array.from({length: info.length}, () => [])
    for (const edge of edges) {
        const [from, to] = edge
        tree[from].push(to)
    }
    
    return tree
}

function solution(info, edges) {
    const tree = buildTree(info, edges)
    const queue = new Queue()
    let result = 0
    // [index, sheepCount, wolfCount, visited]
    queue.push([0, 1, 0, new Set()])
    
    while(!queue.isEmpty()) {
        const [index, sheepCount, wolfCount, visited] = queue.pop()
        result = Math.max(result, sheepCount)
        
        for (const next of tree[index]) {
            visited.add(next)
        }

        for (const next of visited) {
            if (info[next] === 1) {
                // 늑대라면
                if (sheepCount > wolfCount + 1) {
                    const newVisited = new Set(visited)
                    newVisited.delete(next)
                    queue.push([next, sheepCount, wolfCount+1, newVisited])
                }

            } else if (info[next] === 0) {
                // 양이라면
                const newVisited = new Set(visited)
                newVisited.delete(next)
                queue.push([next, sheepCount+1, wolfCount, newVisited])
            }
        }
    }
    
    
    return result;
}