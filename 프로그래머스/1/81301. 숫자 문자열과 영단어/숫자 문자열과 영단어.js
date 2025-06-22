function solution(s) {
    // 결과 숫자 배열
    let answer = [];
    
    // 임시 문자 배열, ex) ['s', 'i', 'x']
    let tempString = [];
    for (const char of s) {
        const num1 = Number(char)
        if (Number.isInteger(num1)) {
            answer.push(num1)
            tempString = []
            continue;
        }
        
        tempString.push(char)
        
        const num2 = changeStringToNumber(tempString.join(""))
        if (Number.isInteger(num2)) {
            answer.push(num2)
            tempString = []
            continue;
        }
    }
    
    return Number(answer.join(""));
}

function changeStringToNumber(str) {
  const map = {
    zero: 0,
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
  };

  return map[str] ?? null;
}