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

print(fibIter(10))
print(fib(10))
print(fibCache(10))