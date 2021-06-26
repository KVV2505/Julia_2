#Написать функцию, осуществляющую циклический сдвиг массива на m позиций "на месте", т.е. без использования дополнительного массива.
function nextindex(k::Int,m::Int,A::Vector{Int})
    if ((k+m)%length(A)!=0)
        a=(k+m)%length(A)
        return a
    else
        a=length(A)
        return a
    end
end

function move!(A::Vector{T},m::Int)::Vector{T} where T
    temp=Vector{Int}(undef,m)
    for i in 1:m
        temp[m+1-i]=A[length(A)+1-i]
    end
    i=length(A)-m
    while(i>0)
        j=nextindex(i,m,A)
        A[j]=A[i]
        i-=1
    end
    for i in 1:m 
        A[i]=temp[i]
    end
    return A
end