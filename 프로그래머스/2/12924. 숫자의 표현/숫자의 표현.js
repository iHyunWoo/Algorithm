function solution(n) {
    let low = 1
    let high = 1
    let sum = 1
    let result = 0
    
    while (high <= n && low <= high) {
        if (sum == n) {
            result += 1
        }

        if (sum <= n) {
            high += 1
            sum += high
        } else if (sum > n) {
            sum -= low
            low += 1
        }
    }
    
        
    return result;
}