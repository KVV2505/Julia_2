#Написать функцию nilpotents(n), для заданного n возвращающую диапазон 
#(т.е. значение типа StepRange{Int64,Int64}), содержащий все не 
#тривиальные нильпотенты кольца вычетов Zn
# Возвращаемый диапазон должен быть пустым, если нетривиальных нильпотентов в кольце нет.
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

function nilpotents(n)
    pr=1
    del=fill(0,n)
    kr=fill(0,n)
    it=1
    count=0
    m=n
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

    count=0
    zero_del=fill(0,m)
    for i in 0:m-1
        if gcd(m,i)!=1 && i!=0
            zero_del[count+1]=i
            count+=1
        end
    end
    count_d=0
    for i in 1: length(del)
        if del[i]!=0
            count_d+=1
        end
    end
    count_z=0
    for i in 1: length(zero_del)
        if zero_del[i]!=0
            count_z+=1
        end
    end 
    
    for i in 1:count_d
        pr=del[i]*pr
    end

    nilpotent=0
    nilp=fill(0,m)
    for j in 1:count_z
        nilpotent=pr*zero_del[j]
        nilp[j]=mod(nilpotent,m)
    end
    if count_z==0
        return 0:0 #пустой диапазон
    else   
        return nilp[1] : nilp[count_z]
    end
end
        




         
    


         
     


    