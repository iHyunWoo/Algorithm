def solution():
    N = int(input())
    farm = []

    for _ in range(N):
        farm.append(list(map(int, input())))

    mid = N // 2
    # mid 기준으로 좌우로 얼마나 퍼져나갈지
    count = 0
    result = 0

    for i in range(N):
        if i <= mid:
            # 좌우로 넓히기
            count += 1
        else:
            # 좌우로 좁히기
            count -= 1

        for j in range(count):
            result += farm[i][mid + j]
            if j != 0:
                result += farm[i][mid - j]

    return result


if __name__ == '__main__':
    testCaseCount = int(input())
    for testCase in range(testCaseCount):
        print(f"#{testCase + 1} {solution()}")
