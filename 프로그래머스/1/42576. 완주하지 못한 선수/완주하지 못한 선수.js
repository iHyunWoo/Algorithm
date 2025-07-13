function solution(participant, completion) {
    let paricipantDict = new Map()

    participant.forEach((person) => {
        const value = paricipantDict.get(person)
        if (!value) {
            paricipantDict.set(person, 1)
        } else {
            paricipantDict.set(person, value + 1)
        }
    })
    
    completion.forEach((person) => {
        const value = paricipantDict.get(person)
        paricipantDict.set(person, value - 1)
    })
    
    let result = ''
    paricipantDict.forEach((value, key) => {
        if (value !== 0) {
            result = key
        }
    })
    
    return result;
}