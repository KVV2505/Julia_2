#Написать функцию ord(a,p), возвращающую порядок заданного элемента a 
#мультипликативной группы кольца вычетов по заданному простому модулю p.

function ord(a,p)  
    ord=0
    G=0
    pr=1
   
    G=p-1
    for i in 1 : G
        if (mod(G ,i)==0)
            for j in 1:i 
                pr=mod((pr*mod(a,p)),p)
            end
            if (pr==1)
                ord=i
                break
            end
            pr=1
        end
    end
             
    return ord
end







