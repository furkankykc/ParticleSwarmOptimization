def fitnes_fun(xx):
    y = []
    r, d = xx.shape
    for k in range(r):
        sum = 0
        for ii in range(d):
            xi = xx[k, ii]
            sum += xi ** 2
        y.append(sum)
    return y
