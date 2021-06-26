#=Реализовать еще один метод функции newton со следующим заголовком

newton(polynom_coeff::Vector{Number}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
где polynom_coeff вектор коэффициентов некоторого многочлена, заданных по убыванию степеней.=#

newton(polinom_coeff::Vector{Number}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)=
    newton(x->(y=evaldiffpoly(x, polynom_coeff); y[1]/y[2]), x; ε_x, ε_y, nmaxiter)

function evaldiffpoly(x,polynom_coeff)
    Q_1=0
    Q=0
    for a in polinom_coeff
        Q_1=Q_1x+Q
        Q=Q*x+a
    end
    return Q, Q_1
end