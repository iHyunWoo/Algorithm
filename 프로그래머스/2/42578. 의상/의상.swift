import Foundation

func solution(_ clothes:[[String]]) -> Int {
    // key: 의상의 종류, value: 의상의 이름
    var clothesDict: [String: [String]] = [:]
    
    // 각 cloth를 dict에 배치
    for cloth in clothes {
        let value = cloth[0]
        let key = cloth[1]
        
        clothesDict[key, default: []].append(value)
    }
    
    var result: Int = 1
    // 해당 종류를 아무것도 안 입는 경우의 수도 있으니 +1
    clothesDict.forEach { result *= $0.value.count + 1 }
    
    // 모든 옷들을 다 안 입은 경우 -1
    return result - 1
}
