#=Реализовать ещё один метод функции newton со следующим заголовком
newton(ff::Tuple{Function,Function}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)
где ff - это кортеж из двух функций, причем ff[1] - это функция одного аргумента, возвращающая значение $f(x)$, а ff[2] - функция одного аргумента, возвращающая значение $f^\prime(x)$.=#

newton(ff::Tuple{Function,Function}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20) = newton((x->ff[1](x)/ff[2](x)), x; ε_x, ε_y, nmaxiter)