function solution(a, b, n) {
    let totalCoke = 0;
    let bottle = n;
    
    while (bottle >= a) {
        let newBottle = Math.floor(bottle / a) * b
        totalCoke += newBottle
        // 남은 병 = 교환으로 얻은 병 + 교환 안하고 남은 병
        bottle = newBottle + bottle % a
    }
    
    return totalCoke;
}