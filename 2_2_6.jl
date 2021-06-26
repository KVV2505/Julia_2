#=Написать функции insertsort!, insertsort, insertsortperm, 
insertsortperm! (по аналогии с пунктом 1) реализующие алгоритм 
сортировки вставками=#
function insertsort!(A)
    for k in eachindex(A) 
        while k>1 && A[k-1] > A[k]
            A[k-1], A[k] = A[k], A[k-1]
            k -= 1
        end
    end
    return A
end

insertsort(A)=insertsort!(copy(A))

function insertsortperm!(A)
    ind=collect(1:length(A))
    for k in eachindex(A) 
        while k>1 && A[k-1] > A[k]
            A[k-1], A[k] = A[k], A[k-1]
            ind[k-1], ind[k] = ind[k], ind[k-1]
            k -= 1
        end
    end
    return ind
end

insertsortperm(A)=insertsortperm!(copy(A))
