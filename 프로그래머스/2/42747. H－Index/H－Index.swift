import Foundation

func solution(_ citations:[Int]) -> Int {
    var sortedCitations = citations.sorted(by: {$0 > $1})
    var result: Int = 0
    
    for (index, citation) in sortedCitations.enumerated() {
        if (index+1) <= citation {
            result = index+1
        }
    }
   
    return result
}