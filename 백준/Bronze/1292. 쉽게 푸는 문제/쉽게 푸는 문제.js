const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
});

let input = [];

readline.on('line', function(line) {
  input = line
}).on('close', function(){
  solution(input);
  process.exit();
});

// solution("3 7")

function solution(input) {
  const firstLine = input.split(" ").map(e => parseInt(e));
  const a = firstLine[0]
  const b = firstLine[1]

  let numbers = [0]
  for (let i=1; i<=46; i++) {
    for (let j=1; j<=i; j++) {
      numbers.push(i)
    }
  }

  let sum = 0
  for (let i=a; i<=b; i++){
    sum += numbers[i]
  }
  
  console.log(sum);
  
}