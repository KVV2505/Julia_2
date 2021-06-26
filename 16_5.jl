function floyd_next(G::AbstractMatrix)
    n=size(G,1)
    C=Array{eltype(G),2}(undef,n,n)
    next=Array{eltype(G),2}(undef,n,n)
    for i in 1:n
        for j in 1:n
            next[i,j] = j
        end
    end
    C=G
    for k in 1:n, i in 1:n, j in 1:n
        if C[i,j] > C[i,k]+C[k,j]
            C[i,j]=min(C[i,j], C[i,k]+C[k,j])
            next[i,j] = k
        end
    end
    return C,next
end