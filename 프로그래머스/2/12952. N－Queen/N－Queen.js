function solution(n) {
    // 1차원 배열로 생각
    // ex) [1, 3, 0, 2] 라면 1행은 1번, 2행은 3번... 인덱스에 존재
    const board = new Array(n).fill(-1)
    let result = 0
    
    function isValid(x, y) {
        for (let i=0; i<x; i++) {
            // 이미 존재하는 열이 있으면 불가
            if (board[i] === y) return false
            // 대각선 체크 -> index 차이가 n이라면, 두 값의 차도 n이어야 함(절대값)
            // [2, 3]
            if (Math.abs(x - i) === Math.abs(y - board[i])) return false
        }
        return true
    }   
    
    function dfs(x) {
        // 끝까지 도달했다면 결과 추가
        if (x === n) {
            result++
            return
        }
        
        for (let i=0; i<n; i++) {
            if (isValid(x, i)) {
                board[x] = i
                dfs(x+1, board)
                // 백트래킹 - 퀸 제거
                board[x] = -1
            }
        }
    }
    
     dfs(0)
    
    return result;
}