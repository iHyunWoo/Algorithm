def solution():
    N = int(input())
    # 지도
    matrix = []

    for i in range(N):
        matrix.append(list(map(int, input())))

    result = [[float('inf') for _ in range(N)] for _ in range(N)]
    queue = [(0, 0)]

    while queue:
        x, y = queue.pop(0)
        result[0][0] = 0

        for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
            nx, ny = x + dx, y + dy
            if 0 <= nx < N and 0 <= ny < N:
                # 다익스트라: 현재 칸 + 다음 칸 복구 비용이 지금까지의 다음칸의 최소 비용보다 작은 경우
                if result[x][y] + matrix[nx][ny] < result[nx][ny]:
                    result[nx][ny] = result[x][y] + matrix[nx][ny]
                    queue.append((nx, ny))

    return result[N-1][N-1]


if __name__ == '__main__':
    testCaseCount = int(input())

    for testCase in range(testCaseCount):
        print(f"#{testCase+1} {solution()}")
