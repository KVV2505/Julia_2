#=Сделать то же самое для k-ой производной многочлена, заданного 
своими коэффициентами (здесь предполагается, что k - это параметр функции evaldiffpoly)=#
function evaldiffpolyk(x,A,k)
    q=zeros(Int64,k-1)
    Q=0
    for a in A
        i=k-1
        while i>1
            q[i]=q[i]*x+q[i-1]
            i=i-1
        end
        q[1]=q[1]*x+Q
        Q=Q*x+a
    end
    n=1
    for i in 1:k-1
        q[i]=q[i]*n
        n=n*(n+1)
    end
    return Q,q
end
