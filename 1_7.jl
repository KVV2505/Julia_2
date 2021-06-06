#Написать функции insertsort!, insertsort, insertsortperm, insertsortperm! 
#(по аналогии с пунктом 1) реализующие алгоритм сортировки вставками

function insertsort!(A)
    n=length(A)
    for k in 2:n
        to_insert_1!(A,k)
    end
    return A
end

function to_insert_1!(A,k) 
    while k>1 && A[k-1] > A[k]
        A[k-1], A[k] = A[k], A[k-1]
        k = k - 1
    end
end

insertsort(A)=insertsort!(copy(A))

function insertsortperm!(A)
    size=length(A)
    index=collect(1:size)
    n=length(A)
    for k in 2:n
        to_insert_2!(A,k,index)
    end
    return index
end

function to_insert_2!(A,k,index) 
    while k>1 && A[k-1] > A[k]
        A[k-1], A[k] = A[k], A[k-1]
        index[k-1],index[k]= index[k],index[k-1]      
        k = k - 1
    end
end
    
insertsortperm(A)=insertsortperm!(copy(A))



