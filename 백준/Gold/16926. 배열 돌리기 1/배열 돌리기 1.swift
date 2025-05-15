import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, R) = (input[0], input[1], input[2])

var board = (0..<N).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }

// 회전을 하는 layer 수
// N과 M 중 작은 값을 2로 나눈 값
// ex) 3 x 5 -> 1
// ex) 3 x 2 -> 1
// ex) 4 x 5 -> 2
let layers = min(N, M) / 2

for layer in 0..<layers {
  // layer의 각 요소를 평면화
  var elements: [Int] = []

  let (startY, startX) = (layer, layer)
  let (endY, endX) = (N - 1 - layer, M - 1 - layer)
  
  // 1. 평면화
  // 상단 가로
  for x in startX..<endX { elements.append(board[startY][x]) }
  // 우측 세로
  for y in startY..<endY { elements.append(board[y][endX]) }
  // 하단 가로(역순)
  for x in stride(from: endX, to: startX, by: -1) { elements.append(board[endY][x]) }
  // 좌측 세로(역순)
  for y in stride(from: endY, to: startY, by: -1) { elements.append(board[y][startX]) }

  // 2. 회전
  let rotate = R % elements.count
  let rotated = Array(elements[rotate...]) + Array(elements[..<rotate])

  // 3. 회전된 값 다시 넣기
  var step = 0
  // 상단 가로
  for x in startX..<endX {
    board[startY][x] = rotated[step]
    step += 1
  }
  // 우측 세로
  for y in startY..<endY {
    board[y][endX] = rotated[step]
    step += 1
  }
  // 하단 가로(역순)
  for x in stride(from: endX, to: startX, by: -1) {
    board[endY][x] = rotated[step]
    step += 1
  }
  // 좌측 세로(역순)
  for y in stride(from: endY, to: startY, by: -1) {
    board[y][startX] = rotated[step]
    step += 1
  }
}

// 출력
for line in board {
  print(line.map { String($0) }.joined(separator: " "))
}