function solution(enroll, referral, seller, amount) {
    // key: 판매원 이름, value: 해당 판매원을 소개시켜준 사람 이름
    const parent = {}
    
    for (let i=0; i<enroll.length; i++) {
        parent[enroll[i]] = referral[i]
    }
    
    // key: 판매원 이름: value: 수익
    const result = {}
    for (let name of enroll) {
        result[name] = 0
    }
    
    for (let i=0; i<seller.length; i++) {
        let currentName = seller[i]
        let remainMoney = amount[i] * 100
        
        // 부모로 가면서 분배
        while(remainMoney > 0 && currentName !== "-") {
            // 현재 판매자에게 90% 정산
            result[currentName] += remainMoney - Math.floor(remainMoney / 10)
            currentName = parent[currentName]
            remainMoney = Math.floor(remainMoney / 10)
        }
    }
    
    return enroll.map((name) => result[name]);
}