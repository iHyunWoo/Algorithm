function solution(n, k, cmd) {
    // 삭제 보관
    const deleted = []
    
    // Linked list - 
    // 위를 가르키는 배열
    const up = [...new Array(n+2)].map((_, i) => i - 1)
    // 아래를 가르키는 배열
    const down = [...new Array(n+2)].map((_, i) => i + 1)
    
    // 현재 위치. 인덱스 기준으로 +1
    let cursor = k + 1
    
    for (const command of cmd) {
        if (command[0] === "C") {
            deleted.push(cursor)
            up[down[cursor]] = up[cursor]  // 하나 아래의 위 포인터를 현재의 위로 바꿈(현재를 지나치게)
            down[up[cursor]] = down[cursor] // 하나 위의 아래 포인터를 현재의 아래로 바꿈
            
            if (down[cursor] > n) {
                // 마지막을 삭제하면 하나 위로 커서가 올라감
                cursor = up[cursor]
            } else {
                // 커서가 밑으로 내려감
                cursor = down[cursor]
            }
        } else if (command[0] === "Z") {
            const rollback = deleted.pop()
            down[up[rollback]] = rollback
            up[down[rollback]] = rollback
        } else {
            const [action, num] = command.split(" ")
            if (action === 'U') {
                for (let i=0; i<num; i++) {
                    cursor = up[cursor]
                }
            } else if (action === 'D') {
                for (let i=0; i<num; i++) {
                    cursor = down[cursor]
                }
            }
        }
    }
    
    const answer = new Array(n).fill("O")
    for (const d of deleted) {
        answer[d - 1] = 'X'
    }
    return answer.join("");
}