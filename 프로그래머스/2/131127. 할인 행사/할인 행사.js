function solution(want, number, discount) {
    const wants = {}
    for (let i=0; i<want.length; i++) {
        wants[want[i]] = number[i]
    }
    
    let answer = 0;
    for (let i=0; i<discount.length - 9; i++) {
        const discounts = {}
        
        for (let j=i; j<i+10; j++) {
            if (wants[discount[j]]) {
                discounts[discount[j]] = (discounts[discount[j]] ?? 0) + 1
            }
        }
        
        if (deepEqual(discounts, wants)) answer += 1
    }
    
    return answer;
}

// 객체 일치 여부 확인
function deepEqual(a, b) {
    const keysA = Object.keys(a)
    const keysB = Object.keys(b)
    if (keysA.length !== keysB.length) return false
    
    for (const key of keysA) {
        if (a[key] !== b[key]) return false
    }
    
    return true
}