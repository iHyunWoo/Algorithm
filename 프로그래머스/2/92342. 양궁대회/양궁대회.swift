import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var maxShootLog: [Int] = []
    var maxScore = 0
    
    func dfs(index: Int, shootCount: Int, shootLog: [Int]) {
        if shootCount > n {return}
        
        if index == 11 {
            var currentShootLog = shootLog
            let remain = n - shootCount
            let lastValue = currentShootLog.removeLast()
            currentShootLog.append(lastValue+remain)
            saveMaxValue(shootLog: currentShootLog)
            return
        }
        
        var updatedShootLog = shootLog
        
        // 이번 점수에서 이길 경우 -> 어피치보다 1발 더 높아아 함
        let apacheCount = info[index]
        updatedShootLog.append(apacheCount + 1) 
        dfs(index: index + 1, shootCount: shootCount+apacheCount+1, shootLog: updatedShootLog)
        
        // 백트래킹
        updatedShootLog.removeLast()
        
        // 이번 점수는 포기하는 경우
        updatedShootLog.append(0)
        dfs(index: index + 1, shootCount: shootCount, shootLog: updatedShootLog)
    }
    
    func saveMaxValue(shootLog: [Int]) {
        // print(shootLog)
        let score = calcScore(shootLog: shootLog)
        
        if score == -1 {return}
        
        if maxScore < score {
            maxScore = score
            maxShootLog = shootLog
        } else if maxScore == score {
            if maxShootLog.isEmpty {
                maxShootLog = shootLog
            } else {
                for i in 0...10 {
                    let index = 10 - i
                    if shootLog[index] > maxShootLog[index] {
                        maxShootLog = shootLog
                        break
                    } else if shootLog[index] < maxShootLog[index] { // 이미 최대치에서 낮은 값이 크면 더 확인할 필요가 없음
                        break
                    }
                }
            }
        }
    }
    
    // 라이언과 어피치의 점수 차를 리턴하고, 어피치의 점수가 더 높다면 -1 리턴
    func calcScore(shootLog: [Int]) -> Int {
        var lionScore = 0
        var apacheScore = 0
        for i in 0...10 {
            let target = 10 - i
            if shootLog[i] > info[i] {
                lionScore += target
            } else if info[i] != 0 {
                apacheScore += target
            }
        }
        // if lionScore > apacheScore {
            // print("lion 점수: \(lionScore), 어피치 점수: \(apacheScore) - \(shootLog)")
        // }
        
        return lionScore > apacheScore ? lionScore - apacheScore : -1
    }
    
    dfs(index: 0, shootCount: 0, shootLog: [])
    
    return maxShootLog.isEmpty ? [-1] : maxShootLog
}