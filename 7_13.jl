#Написать функцию высшего порядка bisection(f::Function, a, b; atol, rtol)
#реализующую решатель уравнения вида f(x)=0, реализующую метод деления 
#отрезка пополам, где аргументы atol, rtol задают требуемую абсолютную и 
#относительную точность (atol, rtol - это именованные параметры, которым 
#можно присвоить также некоторые значения по умолчанию).

#f=f(x)=.....
function bisect(f::Function, a, b, atol, rtol=Inf)
    y_a=f(a)
    while b-a > atol
        x_m = (a+b)/2
        y_m=f(x_m)
        if y_m==0
            return x_m
        end
        if y_m*y_a > 0 
            a=x_m
        else
            b=x_m
        end
    end
    return (a+b)/2
end

