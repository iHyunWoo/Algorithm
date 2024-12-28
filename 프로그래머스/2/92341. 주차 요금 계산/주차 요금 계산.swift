import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let detailRecords: [[String]] = records.map { $0.split(separator: " ").map { String($0) } }
    var parkingLot: [String: String] = [:]  // 현재 주차장에 들어가 있는 자동차(key-자동차번호, value-입차시간)
    var parkingLotLog: [Int: Int] = [:]  // 결과 값(key-자동차번호, value-누적시간)
    
    func calcDuration(inTime: String, outTime: String) -> Int {
        let inTimeSplit: [Int] = inTime.split(separator: ":").map {Int($0)!}
        let outTimeSplit: [Int] = outTime.split(separator: ":").map {Int($0)!}
        return (outTimeSplit[0] - inTimeSplit[0]) * 60 + (outTimeSplit[1] - inTimeSplit[1])
    }
    
    func calcFee(duration: Int) -> Int {
        let defaultTime = fees[0]
        let defaultFee = fees[1]
        let unitTime = fees[2]
        let unitFee = fees[3]
        
        var fee = 0
        if duration <= defaultTime {
            // 기본시간 이내
            fee = defaultFee
        } else {
            let overTime = duration - defaultTime
            fee = (overTime / unitTime) * unitFee + defaultFee
            
            if overTime % unitTime != 0 {fee += unitFee}
        }
        
        return fee
    }
    
    for record in detailRecords {
        let time = record[0]
        let number = record[1]
        let type = record[2]
        if type == "IN" {
            // 입차의 경우
            parkingLot[number] = time
        } else {
            // 출차의 경우
            let inTime = parkingLot[number]!
            parkingLot.removeValue(forKey: number)
            let duration = calcDuration(inTime: inTime, outTime: time)
            parkingLotLog[Int(number)!, default: 0] += duration
        }
    }
    
    for parkedCar in parkingLot {
        let inTime = parkedCar.value
        let duration = calcDuration(inTime: inTime, outTime: "23:59")
        parkingLotLog[Int(parkedCar.key)!, default: 0] += duration
    }
    
    let sortedLog = parkingLotLog.sorted { $0.key < $1.key }
    let feeLog = sortedLog.map { calcFee(duration: $0.value) }
    
    return feeLog
}