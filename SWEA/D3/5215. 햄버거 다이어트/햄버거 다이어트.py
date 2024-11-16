def solution():
    global maxScore
    N, calorieLimit = list(map(int, input().split()))
    ingredientList = []

    for _ in range(N):
        score, calorie = list(map(int, input().split()))
        ingredientList.append((score, calorie))

    def dfs(index, score, calorie):
        global maxScore
        if calorie > calorieLimit:
            return

        maxScore = max(maxScore, score)

        if index == N:
            return

        dfs(index + 1, score + ingredientList[index][0], calorie + ingredientList[index][1])
        dfs(index + 1, score, calorie)

    dfs(0, 0, 0)

    return maxScore


if __name__ == '__main__':
    testCaseCount = int(input())
    for testCase in range(testCaseCount):
        maxScore = 0
        print(f"#{testCase + 1} {solution()}")
