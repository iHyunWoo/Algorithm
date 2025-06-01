function solution(numbers) {
    let answer = new Set();
    for (let i = 1; i<numbers.length; i++) {
        for (let j = 0; j<i; j++) {
            answer.add(numbers[i]+numbers[j])
        }
    }
    
    return [...answer].sort((a, b) => a - b);
}