#Написать функцию log(a::Real,x::Real,ε::Real), реализующую приближенное вычисление 
#логарифма по основанию a>1 числа x>0 с максимально допустимой погрешностью ε>0 
#(без использования разложения логарифмической функции в степенной ряд).

function log(a::T,x::T,ε::T) where T<:AbstractFloat
    z, t, y = T(x), T(1), T(0)
    while z > a || z < 1/a || t > ε   
        if z > a
            z = z / a
            y = y + t 
        elseif z < 1/a
            z = z *  a
            y = y - t 
        else 
            t = t / 2
            z = z * z 
        end
    end
    return y
end