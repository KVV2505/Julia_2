#Реализовать оба варианта нерекурсивной сортировки слияниями.
function mergesort_!(a)
    k = 1
    while k < length(a)
        for i in 1:2k:length(a)
            if (i + k - 1 < length(a) < i + 2k -1)
                b = merge2(a[i:i+k-1], a[i+k : lastindex(a)])
                a[i:lastindex(a)] = b
            elseif ( i + 2k -1 <= length(a))
                b = merge2(a[i:i+k-1], a[i+k : i+2k - 1])
                a[i:i+2k-1] = b
            end
        end
        k *= 2
    end

    return a
end
function merge2(A,B)
    C=promote_type(eltype(A),eltype(B))[]
    j=1
    i=1
    z=1
    f1=0
    f2=0
    while z <=length(A)+length(B)
        while i<=length(A) && A[i]<=B[j]
            push!(C,A[i])
            i=i+1
            z=z+1
        end
        if i>length(A)
            i=i-1
            f1=1
        end
        while j<=length(B)  && B[j]<A[i]
            push!(C,B[j])
            j=j+1
            z=z+1
        end
        if j>length(B)
            j=j-1
            f2=1
        end
        if  f1==1
            for f in j:length(B)
                push!(C,B[j])
                j=j+1
                z=z+1
            end
        end
        if  f2==1
            for f in i:length(A)
                push!(C,A[i])
                i=i+1
                z=z+1
            end
        end
    end
    return C
end
