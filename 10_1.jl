#=Реализовать метод Ньютона, написав функцию со следующим заголовком
newton(r::Function, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
где r- это функция одного аргумента, возвращающая при каждом x значение $$\frac{f(x)}{f^\prime(x)},$$ x - заданное начальное приближение.
В случае отсутствия сходимости (в случае превышения заданного максимального числа итераций) функция должна возвращать значение nothing.=#

function newton(r::Function, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
    x_k = x
    i = 0
    while (i <= nmaxiter && (abs(x_k-x) > ε_x || x_k==x))
        x = x_k 
        x_k = x - r(x) #x_k+1
        i+=1
    end
    if (i > nmaxiter)
        return nothing
    else
        return x_k
    end
end
