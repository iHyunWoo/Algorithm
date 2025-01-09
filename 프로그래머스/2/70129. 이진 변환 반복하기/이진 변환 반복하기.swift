import Foundation

// Int를 2진수 String로 변환
func toBinary(_ n: Int) -> String {
    var number = n
    var binary: [Int] = []
    while number > 1 {
        binary.append(number % 2)
        number /= 2
    }
    if number == 1 {binary.append(1)}
    return binary.reversed().map {String($0)}.joined()
}

// String을 Int Arr로 변환
func convertToIntArr(_ str: String) -> [Int] {
    return str.map { Int(String($0))! }
}

// 배열에서 0과 1의 개수를 리턴
func countZeroAndOne(_ arr: [Int]) -> (Int, Int) {
    var zeroCount = 0
    var oneCount = 0
    arr.forEach {
        if $0 == 0 {zeroCount += 1}
        else if $0 == 1 {oneCount += 1}
    }
    
    return (zeroCount, oneCount)
}

func solution(_ s:String) -> [Int] {
    if s == "1" {
        return [0, 0]
    }
    
    var sArr: [Int] = convertToIntArr(s)
    var removeZeroCount = 0
    var convertCount = 0
    while true {
        let (zeroCount, oneCount) = countZeroAndOne(sArr)
        removeZeroCount += zeroCount
        convertCount += 1
        
        if oneCount == 1 {
            break
        }
        
        let binary = toBinary(oneCount)
        sArr = convertToIntArr(binary)
    }
    
    
    
    return [convertCount, removeZeroCount]
}
