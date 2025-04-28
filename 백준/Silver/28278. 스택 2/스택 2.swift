import Foundation

let n = Int(readLine()!)!

var stack: [Int] = []
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int($0)!}
  let command = input[0]
  
  switch command {
  case 1:
    stack.append(input[1])
  case 2:
    if stack.count > 0 {
      print(stack.removeLast())
    } else {
      print(-1)
    }
  case 3:
    print(stack.count)
  case 4:
    print(stack.isEmpty ? 1 : 0)
  case 5:
    if stack.count > 0 {
      print(stack.last!)
    } else {
      print(-1)
    }
  default:
    break
  }
}