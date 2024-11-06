import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 체육복이 있는 사람 리스트(있는 경우가 true) 
    // 0번 인덱스는 미사용
    var result: [Bool] = Array(repeating: true, count: n+1)
    result[0] = false
    
    var sortedLost = lost.sorted()
    var sortedReserve = reserve.sorted()
    
    // 잃어버렸다!
    sortedLost.forEach { lostPerson in
        result[lostPerson] = false
    }
    var lostAndResevePeople: [Int] = []
    for lostPerson in sortedLost {
        // 잃어버린 본인이 여벌을 가지고 있다면
        if let _ = sortedReserve.first(where: {$0 == lostPerson}) {
            lostAndResevePeople.append(lostPerson)
        }
    }
    
    // 본인이 잃어버리고 여벌 챙긴경우 처리
    lostAndResevePeople.forEach { lostAndResevePerson in
        sortedLost.removeAll(where: {$0 == lostAndResevePerson})
        sortedReserve.removeAll(where: {$0 == lostAndResevePerson})
        result[lostAndResevePerson] = true
    }
    
    sortedReserve.forEach { extraPerson in            
        // 이전 사람에게 빌려줄까?
        if extraPerson - 1 >= 1 && !result[extraPerson-1] {
            result[extraPerson-1] = true
            return
        }
                     
        // 다음 사람에게 빌려줄까?
        if extraPerson + 1 <= n && !result[extraPerson+1] {
            result[extraPerson+1] = true
            return 
        }
    }
    
    return result.filter { $0 == true }.count
}