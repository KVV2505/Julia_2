#=Написать функцию, вычисляющую $n$-ую частичную сумму ряда 
Тейлора функции $$\cos(x)=1-\frac{x^2}{2!}+\frac{x^4}{4!}-\frac{x^6}{6!}+...$$ для заданного 
значения аргумента $x$. Вычислительная сложность алгоритма должна =#
иметь оценку $O(n)$.
function cosins(x,v)
    xsq=x^2
    a=1
    k=1
    s=typeof(x)(0)
    while abs(a)>v
        s+=a
        a=-a*xsq/(2k)/(2k-1)
        k+=1
    end
    return s
end