def fib(n):
    if n < 2:
        return n
    else:
        return fib(n-1) + fib(n-2)


def fibCache(n):
    cache = {
        0: 0,
        1: 1
    }

    if n in cache:
        return cache[n]
    else:
        cache[n] = fib(n - 1) + fib(n - 2)
        return cache[n]

def fibIter(n):
    ans = [0, 1]
    for i in range(2, n + 1):
        res = ans[i-1] + ans[i-2]
        ans.append(res)
    ans.pop(1)
    return ans[n-1]


#another way to implement iterative fib

def fibIterAlt(a: int, b: int, count: int) -> int:
    if count == 0:
        return b
    else:
        return fibIterAlt(a + b, a, count - 1)

def fibAlt(n:int) -> int:
    return fibIterAlt(1, 0, n)        

print(fibIter(10))
print(fib(10))
print(fibCache(10))
print(fibAlt(10))


def firstDenomWays(types: int) -> int:
    #first type is the smallest of the bunch, which depends on how many types of coins there are
    if types > 5:
        raise Exception("type system only accommodates up to 5")
    else: 
        if types == 1:
            return 1
        elif types == 2:
            return 5
        elif types == 3:
            return 10
        elif types == 4:
            return 25
        elif types == 5:
            return 50

def cc(amount: int, types: int) -> int:
    if amount == 0:
        return 1
    elif (amount < 0) or (types == 0):
        return 0
    else:
        return cc(amount, types - 1) + cc(amount - firstDenomWays(types), types)

#ways to count change with a 5 types of coin system
def countChange(amount):
    return cc(amount, 5)

print(countChange(100))