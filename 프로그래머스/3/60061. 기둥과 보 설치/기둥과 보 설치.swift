import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    var building: [[Int]] = []
    
    func isColumnBuildOK(_ x: Int, _ y: Int) -> Bool {
        // 지면에 설치하는 경우
        if y == 0 {return true}
        
        // 보의 한쪽 끝 부분 위에 설치하는 경우
        let rows = building.filter {$0[2] == 1 }
        if rows.contains([x, y, 1]) || rows.contains([x-1, y, 1]) {return true}
        
        // 다른 기둥 위에 설치하는 경우
        let cols = building.filter {$0[2] == 0 }
        if cols.contains([x, y-1, 0]) {return true}
        
        return false
    }
    
    func isColumnRemoveOK(_ x: Int, _ y: Int) -> Bool {
        // 귀납적 방법으로 제거 여부 확인
        // 1. 우선 해당 프레임 제거
        building.removeAll(where: { $0 == [x, y, 0] })
        // 2. 해당 프레임에 영향받는 프레임 설치 가능 여부 확인
        // 3. 영향군 - 바로 위 기둥, 왼쪽 보, 오른쪽 보
        
        // 바로 위 기둥이 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x, y+1, 0]) && !isColumnBuildOK(x, y+1) {
            building.append([x, y, 0])
            return false
        }
        
        // 왼쪽 보가 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x-1, y+1, 1]) && !isRowBuildOK(x-1, y+1) {
            building.append([x, y, 0])
            return false
        }
        
        // 오른쪽 보가 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x, y+1, 1]) && !isRowBuildOK(x, y+1) {
            building.append([x, y, 0])
            return false
        }
        
        building.append([x, y, 0])
        return true
    }
    
    func isRowBuildOK(_ x: Int, _ y: Int) -> Bool {
        // 한쪽 끝 부분이 기둥 위에 있는 경우
        let cols = building.filter {$0[2] == 0 }
        if cols.contains([x, y-1, 0]) || cols.contains([x+1, y-1, 0]) {return true}
        
        // 양쪽 끝 부분이 다른 보와 동시에 연결된 경우
        let rows = building.filter {$0[2] == 1 }
        if rows.contains([x-1, y, 1]) && rows.contains([x+1, y, 1]) {return true}
        
        return false
    }
    
    func isRowRemoveOK(_ x: Int, _ y: Int) -> Bool {
        // 귀납적 방법으로 제거 여부 확인
        // 1. 우선 해당 프레임 제거
        building.removeAll(where: { $0 == [x, y, 1] })
        // 2. 해당 프레임에 영향받는 프레임 설치 가능 여부 확인
        // 3. 영향군 - 바로 위 기둥, 오른쪽 기둥, 왼쪽 보, 오른쪽 보
        
        // 바로 위 기둥이 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x, y, 0]) && !isColumnBuildOK(x, y) {
            building.append([x, y, 1])
            return false
        }
        
        // 오른쪽 위 기둥이 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x+1, y, 0]) && !isColumnBuildOK(x+1, y) {
            building.append([x, y, 1])
            return false
        }
        
        // 왼쪽 보가 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x-1, y, 1]) && !isRowBuildOK(x-1, y) {
            building.append([x, y, 1])
            return false
        }
        
        // 오른쪽 보가 있고, 그게 설치 불가하면 제거 실패
        if building.contains([x+1, y, 1]) && !isRowBuildOK(x+1, y) {
            building.append([x, y, 1])
            return false
        }
        
        building.append([x, y, 1])
        return true
    }
    
    
    for currentStep in build_frame {
        let x = currentStep[0]
        let y = currentStep[1]
        let frameType = currentStep[2] // 0이면 기둥, 1이면 보
        let isBuild = currentStep[3] == 1
        
        if isBuild {
            if frameType == 0 {
                if isColumnBuildOK(x, y) {
                    // print("(\(x), \(y)) 위치에 기둥 건설 성공")
                    building.append([x, y, frameType])
                } else {
                    // print("(\(x), \(y)) 위치에 기둥 건설 실패")
                }
                
            } else {
                if isRowBuildOK(x, y) {
                    // print("(\(x), \(y)) 위치에 보 건설 성공")
                    building.append([x, y, frameType])
                } else {
                    // print("(\(x), \(y)) 위치에 보 건설 실패")
                }
            }
        } else {
            if frameType == 0 {
                if isColumnRemoveOK(x, y) {
                    // print("(\(x), \(y)) 위치에 기둥 제거 성공")
                    building.removeAll(where: { $0 == [x, y, frameType] })
                } else {
                    // print("(\(x), \(y)) 위치에 기둥 제거 실패")
                }
            } else {
                if isRowRemoveOK(x, y) {
                    // print("(\(x), \(y)) 위치에 보 제거 성공")
                    building.removeAll(where: { $0 == [x, y, frameType] })
                } else {
                    // print("(\(x), \(y)) 위치에 보 제거 실패")
                }
            }
        }
        
    }
    
    return building.sorted {
        if $0[0] == $1[0] {  // x좌표가 같다면
            if $0[1] == $1[1] {  // y좌표가 같다면
                return $0[2] < $1[2]  // 기둥(0)이 보(1)보다 먼저오게(오름차순))
            } else {
                return $0[1] < $1[1]
            }
        } else {
            return $0[0] < $1[0]
        }
    }
}