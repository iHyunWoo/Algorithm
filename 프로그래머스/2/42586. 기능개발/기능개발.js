function solution(progresses, speeds) {
    let remainDays = []
    progresses.forEach((progress, index) => {
        const remainProgress = 100 - progress
        const speed = speeds[index]
        remainDays.push(Math.ceil(remainProgress / speed))
    })
    
    // 지나간 일
    let currentDay = remainDays[0]
    let answer = [0]
    for (const remainDay of remainDays) {
        // 앞 작업보다 빨리 끝났다면
        if (remainDay <= currentDay) {
            answer[answer.length - 1] += 1
        } else {
            currentDay = remainDay
            answer.push(1)
        }
    }
    
    
    return answer;
}