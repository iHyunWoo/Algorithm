let firstLine: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0]
let M = firstLine[1]
var numbers: [Int] = []

for _ in 0..<N {
    numbers.append(Int(readLine()!)!)
}
// 정렬해서 탐색 횟수 줄임
numbers.sort()

var result = Int.max
// end를 투포인터로 사용
var end = 0

for start in 0..<N {
    let num1 = numbers[start]
    while end < N {
        let num2 = numbers[end]
        let diff = abs(num1 - num2)
        if diff >= M {
            result = min(result, diff)
            break
        } else {
            end += 1
        }
        
    }
}

print(result)