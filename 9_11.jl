#=Написать функцию, получающую на вход матрицу СЛАУ приведенную к 
ступенчатому виду и возвращающую матрицу, содержащую фундаментальную
систему решений этой СЛАУ, в случае, если система вырожденая, или, в 
противном случае, - пустой вектор-столбец (длина корого равна числу 
переменных, т.е. числу столбцов полученной матрицы).=#
function SLAF(A)
    b=Array{Union{Missing,  Array},1}(missing,size(A,1))
    if size(A,1)!=size(A,2)
        return b
    end
    for i in firstindex(A,1):lastindex(A,1)
        b[i]=mslaf!(i,length(b),A)
    end
    b[lastindex(b)]=zeros(length(b))
    return b
end

function mslaf!(k,d,A)
    c=Array{Int}(undef,d)
    for i in  k+1:d
        c[i] = -(A[k,i]/A[k,k])
    end
    for i in 1:k
        c[i]=0
    end
    return c
end



