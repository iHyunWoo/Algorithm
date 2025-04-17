import Foundation

let testCaseCount = Int(readLine()!)!

var testCases: [Int] = []
for _ in 0..<testCaseCount {
  let testCase = Int(readLine()!)!
  testCases.append(testCase)
}

var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: 4), count: 10001)
dp[1][1] = 1
dp[1][2] = 0
dp[1][3] = 0

dp[2][1] = 1
dp[2][2] = 1
dp[2][3] = 0

dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

for i in 4...testCases.max()! {
  dp[i][1] = dp[i-1][1]
  dp[i][2] = dp[i-2][1] + dp[i-2][2]
  dp[i][3] = dp[i-3][1] + dp[i-3][2] + dp[i-3][3]
}

testCases.forEach { tc in
  print(dp[tc][1] + dp[tc][2] + dp[tc][3])
}

/*
 순서만 다른건 같은걸로
 -> 무조건 내림차순 정렬로해서 순서 신경 안쓰게
 dp[4][1] = 1
 dp[4][2] = 2
 dp[4][3] = 1
 
 dp[4][1] = dp[3][1] = 1
 dp[4][2] = dp[2][1] + dp[2][2] = 2
 dp[4][3] = dp[1][1] + dp[1][2] + dp[1][3] = 1
 
 dp[5]는?
 - 1*5
 - 2 + 1*3
 - 2*2 + 1
 - 3 + 1*2
 - 3 + 2
 
 dp[5][1] = dp[4][1] = 1
 dp[5][2] = dp[3][1] + dp[3][2] = 2
 dp[5][3] = dp[2][1] + dp[2][2] + dp[2][3] = 1
 */