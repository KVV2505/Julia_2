#Задача 1. Написать функцию pow(a, n::Integer), возвращающую значение a^n, 
#и реализующую алгоритм быстрого возведения в степень.
function pow(a,n::Integer) 
	res = 1
	while (n>0)
		if mod(n,2)==0 #n-четное 
			a=a*a
			n=div(n,2)
		else 
			res=res*a
			n=n-1
        end
    end
return res;
end
