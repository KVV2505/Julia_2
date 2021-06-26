#Реализовать функцию, аналогичную встроенной функции transpose, осуществляющую транспонирование матрицы "на месте" (без использования вспомогательного массива)
function transpose2_2!(A::Matrix)
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