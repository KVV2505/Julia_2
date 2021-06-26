#Задачи 2-3. Реализовать эти две разновидности пузырьковой сортировки.
function new_buble_sort1(a::Vector{Int})
    i_min=minimum(a)
    for i in 1:length(a)
        if ( a[i]!= min)
            for j in i:length(a)
                if (a[i]>a[j])
                    a[i],a[j]=a[j],a[i]
                end
            end
            i_min=a[i]
        end
    end
    return a
end
