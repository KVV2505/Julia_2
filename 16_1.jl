function comm(A)
    for i in 1:size(A)[1]
        for j in 1:size(A)[2]
            if (A[i,j]<=0 && i!=j)
                A[i,j]=1e8
            end
        end
    end
    sum = 0
    min = 1e8
    for n in permutations(size(A)[1])
        for i in 1:size(A)[1]
            sum += A[n[i],n[i+1 > size(A)[1] ? 1 : i+1]]
        end
        if sum < min
            min = sum
        end
        sum = 0
    end
    return min
end

function next_permute!(p::AbstractVector)
    k = firstindex(p)-1
    for i in lastindex(p)-1:-1:firstindex(p)
        if p[i] < p[i+1]
            k=i
            break
        end
    end
    if k == firstindex(p)-1
        return nothing
    end
    i=k+1
    while i < lastindex(p) && p[i+1] > p[k]
        i+=1
    end
    p[k], p[i] = p[i], p[k]
    reverse!(@view p[k+1:end])
    return p
end

function permutations(a::AbstractVector)
    n = length(a)
    p=collect(1:n)

    function next()
        perm_a = a[p]
        p = next_permute!(p)
        return perm_a
    end

    return (next() for _ in 1:factorial(n))
end

permutations(n::Integer) = permutations(collect(1:n))