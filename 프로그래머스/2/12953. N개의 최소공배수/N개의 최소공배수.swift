func solution(_ arr:[Int]) -> Int {
    let maxNumber: Int = arr.max()!
    var result: Int = 0
    
    while true {
        result += maxNumber
        
        var count = 0
        for num in arr {
            if result % num == 0 {
                count += 1
            }
        }
        
        if count == arr.count { break }
    }
    
    return result
}