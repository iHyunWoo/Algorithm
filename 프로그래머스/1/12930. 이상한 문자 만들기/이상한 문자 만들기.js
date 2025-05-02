function solution(s) {
    let answer = '';
    let words = s.split(' ')
    
    answer = words.map ((word) => {
       let chars = word.split('') 
       
       for (let i = 0; i < chars.length; i++) {
           if (i % 2 === 0) {
               chars[i] = chars[i].toUpperCase()
           } else {
               chars[i] = chars[i].toLowerCase()
           }
       }
        
        return chars.join('')
    }).join(' ')
    
    return answer;
}