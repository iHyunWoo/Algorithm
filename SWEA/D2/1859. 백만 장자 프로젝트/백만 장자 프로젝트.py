def solution():
    N = int(input())
    priceList = list(map(int, input().split()))
    priceList.reverse()

    localMaxPrice = 0
    buyPriceList = []
    result = 0

    for price in priceList:
        if price > localMaxPrice:
            for buyPrice in buyPriceList:
                # 구매했던 것 매매
                result += localMaxPrice - buyPrice

            buyPriceList.clear()
            localMaxPrice = price
        else:
            buyPriceList.append(price)

    # 남아있는 구매 물품 매매
    for buyPrice in buyPriceList:
        result += localMaxPrice - buyPrice

    return result


if __name__ == '__main__':
    testCaseCount = int(input())
    for testCase in range(testCaseCount):
        print(f"#{testCase + 1} {solution()}")
