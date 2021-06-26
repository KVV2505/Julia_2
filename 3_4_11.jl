#Реализовать функцию, аналогичную встроенной функции transpose, с использованием вспомогательного массива
function transpose2_(A::Matrix{T})::Matrix{T} where T
    B=Matrix{eltype(A)}(undef,size(A))
    n,m = size(A)
    for j in 1:n
        for i in j:m
            B[i,j]=A[j,i]
            B[j,i]=A[i,j]
        end
    end
    return B
end
    