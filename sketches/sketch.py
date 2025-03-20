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