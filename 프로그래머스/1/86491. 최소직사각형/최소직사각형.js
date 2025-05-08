function solution(sizes) {
    let maxWidth = 0
    let maxHeight = 0
    
    for (const rect of sizes) {
        let width = rect[0]
        let height = rect[1]
        
        // 항상 큰 값이 앞으로 오도록
        if (height > width) { 
            const temp = width
            width = height
            height = temp
        }
        
        if (maxWidth < width) {
            maxWidth = width
        }
        
        if (maxHeight < height) {
            maxHeight = height
        }
    }
    
    return maxWidth * maxHeight;
}