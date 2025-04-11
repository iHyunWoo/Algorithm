import Foundation

let LIMIT = Int(pow(2.0, 31) as Double)

let firstLine: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let k = firstLine[1]

var coins: [Int] = []

for _ in 0..<n {
  coins.append(Int(readLine()!)!)
}

var dp: [Int] = Array(repeating: 0, count: k+1)
dp[0] = 1

for coin in coins {
  if coin > k { continue }
  
  for i in coin..<k+1 {
    dp[i] += dp[i - coin]
    
    if dp[i] >= LIMIT {
      dp[i] = 0
    }
  }
}

print(dp[k])