func solution(_ s:String) -> String {
    let numbers: [Int] = s.split(separator: " ").map { Int(String($0))! }
    
    return "\(numbers.min()!) \(numbers.max()!)"
}