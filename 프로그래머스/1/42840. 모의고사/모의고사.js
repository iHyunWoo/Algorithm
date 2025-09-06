function solution(answers) {
    const patterns = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    
    const scores = new Array(patterns.length).fill(0)
    
    for (let [i, answer] of answers.entries()) {
        for (let [j, pattern] of patterns.entries()) {
            if (pattern[i % pattern.length] === answer) scores[j] += 1
        }
    }
    
    const maxScore = Math.max(...scores)
    const result = [];
    for (let [i, v] of scores.entries()) {
        if (v === maxScore) result.push(i+1)
    }
    
    return result.sort((a, b) => a - b);
}