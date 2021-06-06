#Написать функцию, формирующую срез заданной матрицы по заданным наборам индексов 
#- имеется ввиду без использования конструкции A[I,J], где I,J - два заданных набора индексов (в примере выше, например, I=[1,2], J=[2,4,5,2]).
function srez(A::AbstractMatrix,I::AbstractVector{<:Integer},J::AbstractVector{<:Integer})
    mass_srez=Matrix{eltype(A)}(undef,length(I),length(J))
    for i in 1:length(I)
        for j in 1:length(J)
            mass_srez[i,j]=A[I[i],J[j]]
        end
    end
    return  mass_srez
end