def solution():
    _ = int(input())
    buildings = list(map(int, input().split(" ")))
    count = 0

    for i in range(0, len(buildings)):
        # 지어지지 않았다면 다음으로
        if buildings[i] == 0:
            continue
        # +-2칸 빌딩들
        nearBuildings = [buildings[i - 2], buildings[i - 1], buildings[i + 1], buildings[i + 2]]

        result = buildings[i] - max(nearBuildings)

        if result > 0:
            count += result

    return count


if __name__ == '__main__':
    for i in range(10):
        print(f"#{i + 1} {solution()}")