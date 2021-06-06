#Написать фунуцию, получающую натуральный аргумент n, и возвращающую для него значение 
#функции Эйлера

function el(n)
   znach_f=n
    
    i=2  
    while i*i<=n
        if (mod(n,i)==0)
            while (mod(n,i)== 0)
                n=n/i
            end
        znach_f=znach_f-(znach_f/i)
        end
        if i*i<=n
            i+=1
        else
            i=2
        end
    end
        
    if (n>1)
        znach_f=znach_f-(znach_f/n)
    end
    
    return znach_f;

end