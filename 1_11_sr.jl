#=Написать обобщенную функцию (findallmax), получающую на вход итерируемый объект, 

содержащий некоторую последовательность (элементы которой можно сравнивать по 

величине), и возвращающую вектор, составленный из индексов элементов входной 

последовательности, имеющих максимальное значение.

Сравнить возможности этой пользовательской функции с возможностями встроенных функций 

findmax и argmax. =#

function findallmax(A)
    imax = 1
    count=0
    for i in eachindex(A)
        if A[i] > A[imax] 
            imax = i
        end
    end
    
    for j in eachindex(A)
        if A[j] == A[imax] 
            count+=1
        end
    end
    
    arr=collect(1:count)
    c=1
    for k in eachindex(A)
        if A[k] == A[imax] 
            arr[c]=k
            c+=1
        end
    end
    return arr
end
