#=Аналогично построить индуктивную функцию и реализовать соответствующий 
программный код, вычисляющий значение второй производной многочлена в точке.=#
function evaldiffpoly2(x,A)
    Q′′=0
    Q′=0
    Q=0
    for a in A
        Q′′=Q′′*x+Q′
        Q′=Q′*x+Q
        Q=Q*x+a
    end
    return Q, Q′,2*Q′′
end
