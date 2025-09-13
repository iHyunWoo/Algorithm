class Node {
    constructor(index, coor, left = null, right = null) {
        this.index = index  // 번호
        this.coor = coor  // 좌표
        this.left = left
        this.right = right
    }
}

function buildBinaryTree(nodeinfo) {
    const nodes = Array.from({length: nodeinfo.length}, (_, i) => i + 1)
    // nodes를 좌표에 따른 정렬 
    nodes.sort((a, b) => {
        const [ax, ay] = nodeinfo[a - 1]
        const [bx, by] = nodeinfo[b - 1]
         // y기준 내림차순, y가 같다면 x기준 오름차순
        return ay === by ? ax - bx : by - ay
    })
    
    // 트리 생성
    let root = null
    for (const number of nodes) {
        const newNode = new Node(number, nodeinfo[number-1])
        
        if (!root) {
            root = newNode
        } else {
            let parent = root
            while (true) {
                if (newNode.coor[0] < parent.coor[0]) {
                    if (parent.left !== null) {
                        parent = parent.left
                        continue;
                    }
                    parent.left = newNode
                    break;
                } else {
                    if (parent.right !== null) {
                        parent = parent.right
                        continue;
                    }
                    parent.right = newNode;
                    break;
                }
            }
        }
    }
    
    return root
}

function preorder(root) {
    // 루트 -> 좌 -> 우
    const result = []
    const stack = [root]
    while (stack.length > 0) {
        const node = stack.pop()
        if (!node) continue;
        
        result.push(node.index)
        stack.push(node.right)
        stack.push(node.left)
    }
    
    return result
}

function postorder(root) {
    // 좌 -> 우 -> 루트
    const result = []
    const stack = [[root, false]]
    while (stack.length) {
        const [node, visited] = stack.pop()
        if(!node) continue
        
        if (visited) {
            result.push(node.index)
        } else {
            stack.push([node, true])
            stack.push([node.right, false])
            stack.push([node.left, false])
        }
    }
    
    return result
}

function solution(nodeinfo) {
    const tree = buildBinaryTree(nodeinfo)
    const preorderResult = preorder(tree)
    const postorderResult = postorder(tree)
    
    return [preorderResult, postorderResult];
}