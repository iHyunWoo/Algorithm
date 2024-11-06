import Foundation

func solution(_ s:String) -> Bool
{   
    var count: Int = 0
    var stack: [Character] = Array(s)
    
    for char in stack {
        if char == "(" {
            // 여는 괄호면 count +1
            count += 1
        } else {
            // 닫는 괄호면 count -1
            count -= 1
            
            // 만약 count가 음수가 된다면 불가능한 괄호 쌍
            if count < 0 {
                break
            }
        }
    }

    return count == 0
}