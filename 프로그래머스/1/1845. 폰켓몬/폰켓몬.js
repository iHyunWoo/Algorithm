function solution(nums) {
    const monsters = new Map()
    
    for (const num of nums) {
        if (monsters.has(num)) {
            monsters.set(num, monsters.get(num) + 1);
        } else {
            monsters.set(num, 1);
        }
    }
    
    return Math.min(monsters.size, nums.length / 2);
}