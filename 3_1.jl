#Реализовать функцию, выполняющую транспонирование (transpose - 
#соответствующая встроенная функция julia) (Указание: сначала разобраться 
#с алгоритмом перестановки элементов одномерного массива в обратном 
#порядке. В julia имеется соответствующая встроенная функция - reverse)

function transpose2!(A::Matrix)
    n=size(A)
    for i in 1:n[1]
        for j in i:n[1]
            v=A[i,j]
            A[i,j]=A[j,i]
            A[j,i]=v
        end
    end

    return A
        
end
