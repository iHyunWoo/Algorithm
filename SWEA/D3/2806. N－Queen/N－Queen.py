def solution():
    N = int(input())
    # i번째 행에 j열에 퀸을 둠, -1은 아직 미정 ex) [0, 1] -> 0행의 0열, 1행의 1열에 퀸을 둠
    row = [-1 for _ in range(N)]

    def validLocation(currentRow, col):
        for r in range(currentRow):
            if row[r] == col:  # 이전 행들 중 현재와 같은 열이 있다면 false
                return False

            if abs(row[r] - col) == abs(currentRow - r):  # 이전 행의 어떤 열과 현재 열의 차 == 이전행과 현재 행 번호와 같아면 대각선에 있는 것
                return False

        return True

    def dfs(currentRow):
        global result

        if currentRow == N:
            result += 1
            return
        for col in range(N):
            row[currentRow] = col
            if validLocation(currentRow, col):
                dfs(currentRow + 1)

    dfs(0)

    return result


if __name__ == '__main__':
    testCaseCount = int(input())
    for testCase in range(testCaseCount):
        result = 0
        print(f"#{testCase + 1} {solution()}")
