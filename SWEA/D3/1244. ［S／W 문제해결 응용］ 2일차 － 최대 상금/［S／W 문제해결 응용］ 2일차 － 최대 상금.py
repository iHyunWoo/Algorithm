def solution():
    testCase = list(input().split(" "))
    numberString = list(testCase[0])
    exchangeCount = int(testCase[1])
    visited = []

    def dfs(currentStep):
        global result

        if currentStep == exchangeCount:
            result = max(result, int("".join(numberString)))
            return

        for i in range(0, len(numberString)):
            for j in range(i+1, len(numberString)):
                numberString[i], numberString[j] = numberString[j], numberString[i]
                num = int("".join(numberString))

                if (currentStep, num) not in visited:
                    visited.append((currentStep, num))
                    dfs(currentStep+1)

                # 백트래킹
                numberString[j], numberString[i] = numberString[i], numberString[j]

    dfs(0)

    return result


if __name__ == '__main__':
    testCaseCount = int(input())
    result = 0

    for i in range(testCaseCount):
        print(f"#{i + 1} {solution()}")
        result = 0