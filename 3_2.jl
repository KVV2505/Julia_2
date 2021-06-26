#на вход поступают вектор и вектор индексов его значений
#ф-ия возвращает вектор, где каждому эл-ту соответсвует нужный индекс
function sort_ind!(A::Vector{Int64}, indperm::Vector{Int64})
    n=length(A)
    for _ in 1:n
        for i in 1:n
            A[i],A[indperm[i]]=A[indperm[i]],A[i]
            indperm[indperm[i]],indperm[i]=indperm[i],indperm[indperm[i]]
        end
    end
return A
end