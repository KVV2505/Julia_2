#Написать функцию inv(m::Integer,n::Integer) возвращающий обратный элемент к значению 
#m в кольце вычетов по модулю n (см. лекцию 3). При этом, если значение n не обратимо, 
#то должно возвращаться значение nothing.
#Указание. Воспользоваться расширенным алгоритмом Евклида, это связано с тем, что 
#алгоритм Евклида является быстрым алгоритмом.

#вложенные функции
#определить евликда в главной

function gcd(m,n)
a, b = m, n
u_a, v_a = 1, 0
u_b, v_b = 0, 1
while b != 0
    k = a÷b
    a, b = b, a % b 
    u, v = u_a, v_a
    u_a, v_a = u_b, u_a
    u_b, v_b = u-k*u_b, v-k*v_b
end
d=u_a*m + v_a*n
return d,u_a
end

#M-модуль кольца
#a-число,для которого ищем обратное значение
#u-обратный элемент
function inv(a,M)
    d,u=gcd(a,M)
    if d!=1
        return nothing
    end
    if u<0
        return u+M
    end
    return u
end 