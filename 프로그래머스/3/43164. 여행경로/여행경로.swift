import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 사용한 티켓 배열
    var used: [Bool] = Array(repeating: false, count: tickets.count)
    // 가능한 경로가 여러 개 인 경우 알파벳 순서를 따르기 때문에 정렬
    let tickets: [[String]] = tickets.sorted(by: {$0[1] < $1[1]})
    
    var ans: [String] = []
    
    func dfs(_ start: String) {
        if ans.count == tickets.count {
            ans.append(start)
            return
        }
        
        for index in tickets.indices {
            let currentTicket = tickets[index]
            if currentTicket[0] == start && !used[index] {
                used[index] = true
                ans.append(start)
                dfs(currentTicket[1])
                
                if ans.count < tickets.count {
                    // 백트래킹 
                    used[index] = false
                    ans.removeLast()
                }
                
               
            }
        }
    }
    
    dfs("ICN")
    
    return ans
}