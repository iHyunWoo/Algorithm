import Foundation

func solution(_ numbers:[Int]) -> String {
    var numberStrings: [String] = numbers.map {String($0)}
    
    // 두 string을 더해서 각 step에서 최대의 결과가 나오도록 정렬
    let sortedNumbers: [String] = numberStrings.sorted(by: { $0+$1 > $1+$0 })
    
    // 첫번째 숫자가 0이라면 정답을 0으로
    if sortedNumbers[0] == "0" {
        return "0"
    } else {
        return sortedNumbers.joined(separator: "")    
    }
}