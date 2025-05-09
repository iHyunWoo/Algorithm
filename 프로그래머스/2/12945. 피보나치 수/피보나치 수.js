function solution(n) {
    const fibos = []
    fibos.push(0)
    fibos.push(1)
    
    for (let i = 2; i<=n; i++) {
        fibos.push((fibos[i-1] + fibos[i-2]) % 1234567)
    }
    
    return fibos[n];
}