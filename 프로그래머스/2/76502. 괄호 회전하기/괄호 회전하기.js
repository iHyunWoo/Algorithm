function solution(s) {
    let answer = 0;
    
    for (let offset=0; offset<s.length; offset++) {
        const stack = []
        for (let i=0; i<s.length; i++) {
            const current = s[(offset + i) % s.length]
            
            if (current === "[" || current === "(" || current === "{") {
                stack.push(current)
                continue;
            } else {
                // 닫는 괄호인데 스택이 비어있으면 중지
                if (stack.length === 0) break;
            }
            
            const last = stack[stack.length - 1]
            if (current === "]" && last === "[") {
                stack.pop()
            } else if (current === ")" && last === "(") {
                stack.pop()
            } else if (current === "}" && last === "{") {
                stack.pop()
            } 

            // 끝날 떄 스택이 비워져 있으면 성공
            if (i === s.length - 1 && stack.length === 0) {
                answer += 1
            }
        }
    }
    
    
    
    
    return answer;
}