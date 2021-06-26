function floyd(G::AbstractMatrix)
    n=size(G,1)
    C=Array{eltype(G),2}(undef,n,n)
    C=G
    for k in 1:n, i in 1:n, j in 1:n
        C[i,j]=min(C[i,j], C[i,k]+C[k,j])
    end
    return C
end