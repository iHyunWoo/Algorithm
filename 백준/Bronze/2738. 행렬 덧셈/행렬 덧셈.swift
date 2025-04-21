import Foundation

let firstLine: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]

var arrA: [[Int]] = []
var arrB: [[Int]] = []

for _ in 0..<n {
  let line: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
  arrA.append(line)
}

for _ in 0..<n {
  let line: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
  arrB.append(line)
}

for i in 0..<n {
  let currentA = arrA[i]
  let currentB = arrB[i]
  var result: [Int] = []
  
  for j in 0..<m {
    result.append(currentA[j] + currentB[j])
  }
  
  print(result.map {String($0)}.joined(separator: " "))
}
