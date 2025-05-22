import Foundation

let firstInput: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
let N = firstInput[0]  // 세로
let M = firstInput[1]  // 가로

var map: [[Int]] = []
for _ in 0..<N {
	let currentRow = readLine()!.split(separator: " ").map({Int($0)!})
	map.append(currentRow)
}

var result: Int = 0

func virusSpreadViaBFS() {
	var testMap = map
	var virusList: [(x: Int, y: Int)] = []
	
	for i in 0..<N {
		for j in 0..<M {
			if map[i][j] == 2 {
				virusList.append((x: j, y: i))
			}
		}
	}
	
	while !virusList.isEmpty {
		let current = virusList.removeFirst()
		
		if current.y > 0 && testMap[current.y-1][current.x] == 0 {
			virusList.append((x: current.x, y: current.y-1))
			testMap[current.y-1][current.x] = 2
		}
		
		if current.y < N-1 && testMap[current.y+1][current.x] == 0 {
			virusList.append((x: current.x, y: current.y+1))
			testMap[current.y+1][current.x] = 2
		}
		
		if current.x > 0 && testMap[current.y][current.x-1] == 0 {
			virusList.append((x: current.x-1, y: current.y))
			testMap[current.y][current.x-1] = 2
		}
		
		if current.x < M-1 && testMap[current.y][current.x+1] == 0 {
			virusList.append((x: current.x+1, y: current.y))
			testMap[current.y][current.x+1] = 2
		}
	}
	
	var currentResult = 0
	for i in 0..<N {
		for j in 0..<M {
			if testMap[i][j] == 0 {
				currentResult += 1
			}
		}
	}
	
	result = max(result, currentResult)
}

func makeWall(_ depth: Int) {
	if depth == 3 {
		virusSpreadViaBFS()
	} else {
		for i in 0..<N {
			for j in 0..<M {
				if map[i][j] == 0 {
					map[i][j] = 1
					makeWall(depth+1)
					map[i][j] = 0  // 백트래킹
				}
			}
		}
	}
}

makeWall(0)
print(result)