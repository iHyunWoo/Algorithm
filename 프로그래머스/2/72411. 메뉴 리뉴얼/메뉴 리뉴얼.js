function solution(orders, course) {
    let answer = [];
    
    for (const c of course) {
        // 모든 조합 구하기
        const combis = []
        for (const order of orders) {
            const orderArr = order.split("").sort()
            const combinations = combination(orderArr, c)
            combis.push(...combinations)
        }
        
        // key: 메뉴명, value: 주문횟수
        const combinedMenu = {}
        for (combi of combis) {
            const key = combi.join("");
            combinedMenu[key] = (combinedMenu[key] || 0) + 1;
        }
        
        // 주문 횟수가 max인 것만 answer에 추가
        let maxValue = Math.max(...Object.values(combinedMenu))
        if (maxValue > 1) {
            for (const [key, value] of Object.entries(combinedMenu)) {
                if (value === maxValue) answer.push(key)
            }
        }
    }
    
    return answer.sort();
}

function combination(arr, n) {
    if (n === 1) return arr.map((v) => [v])
    
    let result = []
    for (let i=0; i<arr.length; i++) {
        const rest = arr.slice(i+1)
        const combi = combination(rest, n-1)
        const combine = combi.map(v => [arr[i], ...v])
        result.push(...combine)
    }
    
    return result
}