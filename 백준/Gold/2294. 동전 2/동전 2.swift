import Foundation

let firstLine: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let k = firstLine[1]
var coins: [Int] = []

for _ in 0..<n {
  coins.append(Int(readLine()!)!)
}
coins.sort()

var dp: [Int] = Array(repeating: 10001, count: k+1)
dp[0] = 0

for i in 1..<(k+1) {
  for coin in coins {
    if i < coin { break }
    
    dp[i] = min(dp[i-coin] + 1, dp[i])
  }
}

print(dp[k] == 10001 ? -1 : dp[k])
