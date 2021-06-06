#Написать функцию zerodivisors(m), возвращающую все делители нуля кольца вычетов по заданному модулю 
function gcd(a,b)
   if (a==0 || b==0) 
        nod=a+b  
   end 
    while (b!=0)
        if (a>b)
            a=a-b  
        else
            b=b-a
        end
    end
nod=a
return nod
end
   
function zerodivisors(m)
   count=0
    zero_del=fill(0,m)
    for i in 0:m-1
        if gcd(m,i)!=1 && i!=0
            zero_del[count+1]=i
            count+=1
        end
    end
    
    count_del=0
    for i in 1:length(zero_del)
        if zero_del[i]!=0
            count_del+=1
        else
            break
        end
    end

    if count_del==0
        return zero_del
    else
        zero_del[1:count_del]
    end
end

    
        


