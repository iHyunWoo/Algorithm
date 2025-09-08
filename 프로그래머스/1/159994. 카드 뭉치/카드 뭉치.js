class Queue {
    items = []
    front = 0
    rear = 0
    
    constructor(array) {
        this.items = array
        this.rear = array.length
    }
    
    push(data) {
        this.items.push(data)
        this.rear++
    }
    
    pop() {
        return this.items[this.front++]
    }
    
    first() {
        return this.items[this.front]
    }
    
}

function solution(cards1, cards2, goal) {
    const cards1Queue = new Queue(cards1)
    const cards2Queue = new Queue(cards2)
    
    let answer = 'Yes'
    
    for (const word of goal) {
        if (cards1Queue.first() === word) {
            cards1Queue.pop()
        } else if (cards2Queue.first() === word) {
            cards2Queue.pop()
        } else {
            answer = 'No'
            break
        }
    }
    

    return answer;
}