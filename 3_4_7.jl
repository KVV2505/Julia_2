#Реализовать встроенные функции вставки/добавления (deleteat!, insert!) элемента массива
function insert!_(A::Vector{T},index::Int,p::T)::Vector{T} where T
    n=length(A)+1
    B=Vector{T}(undef,n)
    for i in 1:index-1
        B[i]=A[i]
    end
    B[index]=p
    for i in index+1:n
        B[i]=A[i-1]
    end
    return B
end

function deleteat!_(A::Vector{T},index::Int)::Vector{T} where T
    n=length(A)-1
    B=Vector{T}(undef,n)
    for i in 1:index-1
        B[i]=A[i]
    end
    for i in index:n
        B[i]=A[i+1]
    end
    return B
end
