function solution(genres, plays) {
    let answer = [];
    // key: 장르, value: 장르 노래 재생횟수 합
    const playObj = {}
    // key: 장르, value: [고유번호, 재생횟수]
    const genreObj = {}
    
    for(let i=0; i<genres.length; i++) {
        const genre = genres[i]
        const play = plays[i]
        
        if (!playObj[genre]) {
            genreObj[genre] = []
            playObj[genre] = 0
        }
        
        genreObj[genre].push([i, play])
        playObj[genre] += play
    }
    
    const sortedObj = Object.keys(genreObj).sort((a, b) => {
        return playObj[b] - playObj[a]
    })
    
    for (const genre of sortedObj) {
        const sortedSong = genreObj[genre].sort((a, b) => {
            return a[1] === b[1] ? a[0] - b[0] : b[1] - a[1]
        })
        
        answer.push(...sortedSong.slice(0, 2).map(song => song[0]))
    }
    
    return answer;
}