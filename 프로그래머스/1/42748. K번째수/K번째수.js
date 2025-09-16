function solution(array, commands) {
    const result = []
    for (const [i, j, k] of commands) {
        const slicedArray = array.slice(i-1, j)
        slicedArray.sort((a, b) => a - b)
        result.push(slicedArray[k-1])
    }

    return result;
}