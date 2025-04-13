function solution(arr) {
    let answer = [];
    
    arr.forEach(num => {
        if (answer.length !== 0 && answer[answer.length - 1] === num) {
            return
        }
        
        answer.push(num)
    })

    return answer;
}