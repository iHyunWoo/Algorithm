function solution(n, m) {
    const answer = [getGCD(n, m), getLCM(n, m)];
    return answer;
}

// 최대공약수
function getGCD(n, m) {
    const minValue = Math.min(n, m)
    for (let i=minValue; i>=1 ; i--) {
        if (n%i === 0 && m%i === 0) {
            return i;
        }
    }
}

// 최소공배수
function getLCM(n, m) {
    let lcm = 1
    while(true) {
        if (lcm % n === 0 && lcm % m === 0) {
            return lcm
        }
        
        lcm += 1
    }
}