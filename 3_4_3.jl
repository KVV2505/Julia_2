function new_buble_sort2(a::Vector{Int})    #ShakerSort
    left=2
    right=length(a)
    while (left<=right)
        j=right
        while(j>2)
            if (a[j-1]>a[j])
                a[j-1],a[j]=a[j],a[j-1]
            end
            j-=1
        end
        for i in left:right
            if (a[i-1]>a[i])
                a[i],a[i-1]=a[i-1],a[i]
            end
        end
        left+=1
        right-=1
    end
    return a
end