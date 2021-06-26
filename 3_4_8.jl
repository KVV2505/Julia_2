#=Реализовать встроенные функции unique (возвращает новый массив,
в который каждый элемент исходного массива входит только по одному разу), 
unique! (удаляет из исходного массива повторяющиеся элементы, оставляя
каждый элемент в единственном экземпляре), allunique (проверяет, состоит 
ли данный массив только из уникальных элементов). Для функций unique и 
unique! обеспечить асимптотическую оценку вычислительной сложности
O(n*log(n)).=#
function allunique_(A::Vector{T})::Vector{T} where T
    for i in 1:length(A)
        for j in 1:length(A)
            if (A[i]==A[j])
                return false
            end
        end
    end
    return true
end

function unique_(A::Vector{T})::Vector{T} where T
    n=length(A)
    a=sort!(copy(A))
    i=1
    while i<=n
        if length(findall(isequal(a[i]),a))!=1
            deleteat!(a,i)
            n=n-1
            i=i-1
        end
        i=i+1
    end
    return a
end
