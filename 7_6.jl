#Написать функцию factor(n), получающую некоторое натуральное число n, и возвращающую 
#кортеж, состоящий из вектора его простых делителей (в порядке возрастания) и вектора
# кратностей этих делителей, т.е. выполняющую факторизацию заданного числа. 

function factor(n)
    del=fill(0,n)
    kr=fill(0,n)
    it=1
    count=0
    for i in 2 : sqrt(n)
        pow=0
        count=0
        while (mod(n,i) == 0) 
            count+=1
            pow+=1
            n /= i
        end
        if count!=0   
            del[it]=i
            kr[it]=pow
            it+=1
        end
    end
    if (n != 1) 
        del[it]=n
        kr[it]=1
    end
    
    count_d=0
    for i in 1:length(del)
        if del[i]!=0
            count_d+=1
        else
            break
        end
    end

    count_k=0
    for i in 1:length(del)
        if del[i]!=0
            count_k+=1
        else
            break
        end
    end

    return del[1:count_d], kr[1:count_k] #кортеж из вектора делителей и вектора кратностей
end

    