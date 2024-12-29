let n = Int(readLine()!)!

var fibo: [Int] = [0, 1]

if n > 1 {
    for i in 2...n {
        fibo.append(fibo[i-1] + fibo[i-2])
    }
}

print(fibo[n])