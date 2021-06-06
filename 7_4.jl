#Написать функцию isprime(n)::Bool, возвращающую значение true, если аргумент есть 
#простое число, и - значение false, в противном случае. При этом следует иметь ввиду,
# что число 1 простым не считается.

function isprime(n)::Bool
    if n==1
        return false
    else
        for i in 2:sqrt(n) 
            if (mod(n,i) == 0) 
                return false
            end
        end
    end
    return true
end