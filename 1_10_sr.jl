#Написать обобщенную функцию (nummax), получающую на вход итерируемый объект, 
#содержащий некоторую последовательность (элементы которой можно сравнивать
#по величине), и возвращающую число максимумов этой последовательности.


function nummax(A)
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

    return count
end
