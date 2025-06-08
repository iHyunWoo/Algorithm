function solution(food) {    
  const foods = food
    .map((count, index) => index.toString().repeat(Math.floor(count / 2)))
    .slice(1)
    .join("")
    
    return foods + "0" + [...foods].reverse().join("");
    return answer;
}