function solution(number) {
    let answer = 0;
    
    for (let start = 0; start < number.length - 2; start++) {
        for (let mid = start + 1; mid < number.length - 1; mid++) {
            for (let end = mid + 1; end < number.length; end++) {
                if (number[start] + number[mid] + number[end] === 0) answer += 1
            }
        }
    }
    return answer;
}