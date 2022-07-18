def twenty_twenty():
    """Come up with the most creative expression that evaluates to 2020,
    using only numbers and the +, *, and - operators.

    >>> twenty_twenty()
    2020
    """
    yearMinus2 = 78*(1+2*3-4+5*6-7)-8
    return yearMinus2

print(twenty_twenty())
g, max, f, h = min, min, max, max
print(max(f(2,g(h(1, 5), 3)), 4))