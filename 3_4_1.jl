#Написать функцию с заголовком findallmax(A::AbstractVector)::
#AbstractVector{Int}, возвращающую вектор индексов всех элементов массива A, 
#имеющих максимальное значение. Алгоритм должен быть однопроходным, т.е.
#иметь асимптотическую оценку вычислительной сложности O(n).
#Указание. Убедиться, что вектор индексов максимальных элементов массива
# является не индуктивной функцией на последовательностях и найти 
#подходящее её индуктивное рысширение.

function find_all_max(a)
    i_max=Vector{Int}(undef,size(a))
    i_max[begin]=firstindex(a)
    n = firstindex(i_max)
    for i in firstindex(a)+1:lastindex(a)
        if A[i]>A[i_max[end]]
            i_max[begin]=i
            n = firstindex(i_max)
        elseif A[i]==A[i_max[end]]
            n+=1
            i_max[n]=i
        end
    end
    return resize!(i_max,n)
end