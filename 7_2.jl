# Написать функцию fibonacci(n::Intrger), возвращающую n-ое число последовательности 

function fibonacci(n::Integer)
    a = 1
    ta=0 
    b = 1
    tb=0
    c = 1
    rc = 0 
    tc=0
    d = 0 
    rd = 1 
         
    while (n>0)
        if (mod(n,2)==1) 
            tc = rc
            rc = rc*a + rd*c
            rd = tc*b + rd*d
        end
            
        ta = a
        tb = b
        tc = c
        a = a*a + b*c
        b = ta*b + b*d
        c = c*ta + d*c 
        d = tc*tb+ d*d
        
        n=div(n,2) 
    end

return rc
end
        