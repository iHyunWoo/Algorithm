function solution(n) {
    const tripleNS = changeDecimalToNS(n, 3)
    const reversedTripleNS = tripleNS.split("").reverse().join("")

    return changeNStoDecimal(reversedTripleNS, 3);
}

// 입력 값, 타겟 진수
function changeDecimalToNS(input, n) {
    let number = input;
    let output = [];
    while (number >= n){
        output.push(number % n)
        number = parseInt(number/n)
    }
    
    output.push(number)
    
    return output.reverse().join("")
}

// 입력 값, 원래 진수
function changeNStoDecimal(input, n) {
    const numbers = input.split()
    let output = 0;
    
    for (let i=0; i<numbers.length; i++) {
        const digit = parseInt(numbers[numbers.length - 1 - i], n);
        output += digit * Math.pow(n, i);
    }
    
    return output
}