import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var currentWeight: Int = 0
    var time: Int = 0
    
    var bridge: [(weight: Int, remainDistance: Int)] = []
    
    for truck in truck_weights {
        while true { 
            time += 1
            
            // 현재 다리에 있는 트럭 한 칸씩 앞으로
            for i in bridge.indices {
                bridge[i].remainDistance -= 1
            }
            
            // 만약 remain이 0, 즉 도착한 트럭은 bridge에서 제거
            if !bridge.isEmpty && bridge[0].remainDistance <= 0 {
                currentWeight -= bridge[0].weight
                bridge.removeFirst()
            }

            // 현재 트럭을 다리에 올릴 수 있다면
            if currentWeight + truck <= weight {
                bridge.append((truck, bridge_length))
                currentWeight += truck
                break
            }
        }
    }
    
    // 다리에 남아있는 차량들이 모두 지나가도록
    if !bridge.isEmpty {
        time += bridge.last!.remainDistance
    }

    
    return time
}