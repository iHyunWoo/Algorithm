import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    for operation in operations {
        let command: [String] = operation.split(separator: " ").map { String($0) }
        
        if command[0] == "I" {
            queue.append(Int(command[1])!)
            queue.sort()
        } else if command[0] == "D" && !queue.isEmpty {
            if command[1] == "1" {
                queue.removeLast()
            } else if command[1] == "-1" {
                queue.removeFirst()
            }
        }
    }
    
    return [queue.last ?? 0, queue.first ?? 0]
}