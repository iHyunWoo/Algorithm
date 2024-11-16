def solution():
    dumpCount = int(input())
    boxes = list(map(int, input().strip().split(" ")))

    for _ in range(dumpCount):
        boxes[boxes.index(max(boxes))] -= 1
        boxes[boxes.index(min(boxes))] += 1

    return max(boxes) - min(boxes)


if __name__ == '__main__':
    for testCase in range(10):
        print(f"#{testCase + 1} {solution()}")
