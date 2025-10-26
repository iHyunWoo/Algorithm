function solution(s){
    var answer = true;
    const stack = []
    
    if (s[0] === ")") answer = false
    
    for (const char of s) {
        if (char === "(") {
            stack.push(char)
        } else {
            if (char[char.length-1] === ")") {
                stack.pop()
            } else {
                answer = false
                break;
            }
        }
    }
    
    if (stack.length !== 0 ) answer = false

    return answer;
}