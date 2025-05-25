function solution(s) {
    let dict = {}
    let answer = [];
    
    for (let i=0; i<s.length; i++) {
        const lastIndex = dict[s[i]]
        if (lastIndex !== undefined) {
            answer.push(i - lastIndex)
        } else {
            answer.push(-1)
        }
        
        dict[s[i]] = i
    }
    
    return answer;
}