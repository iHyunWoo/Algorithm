function solution(d, budget) {
    d.sort((a, b) => b - a)
    
    let answer = 0;
    let currentBudget = 0
    
    while (currentBudget <= budget && d.length > 0) {
        const object = d.pop()
        
        if (currentBudget + object > budget) {
            break
        }
        
        currentBudget += object
        answer += 1
    }
    
    return answer;
}