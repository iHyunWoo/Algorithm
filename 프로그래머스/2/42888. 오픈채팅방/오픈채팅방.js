function solution(record) {
    // key: userId, value: name
    const users = {};
    // [command, userId]의 배열
    let log = []
    
    for (const r of record) {
        const [command, userId, name] = r.split(" ")
        if (command === "Enter") {
            log.push([command, userId])
            users[userId] = name
        } else if(command === "Leave") {
            log.push([command, userId])
        } else if (command === "Change") {
            users[userId] = name
        }
    }
    
    let answer = [];
    
    for (const r of log) {
        const [command, userId] = r
        answer.push(`${users[userId]}님이 ${command === "Enter" ? "들어왔" : "나갔"}습니다.`)
    }

    return answer;
}