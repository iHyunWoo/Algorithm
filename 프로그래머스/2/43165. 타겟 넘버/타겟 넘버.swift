import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    
    func dfs(_ currentIndex: Int, _ sum: Int) {
        // 현재가 마지막이라면
        if currentIndex == numbers.count - 1 {
            // target과 일치한다면 +1
            if sum == target {
                result += 1
            }
            
            return 
        }
        
        dfs(currentIndex+1, sum + numbers[currentIndex+1])
        dfs(currentIndex+1, sum - numbers[currentIndex+1])
    }
    
    dfs(-1, 0)
    
    return result
}