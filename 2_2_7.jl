#Дополнить функцию insertsort! процедурой "быстрого поиска"
function insertsort!(A)
    for k in eachindex(A)
        if k>1
            ind=quicksearch(A[1:k-1],A[k])
            if ind==0
                pushfirst!(A,A[k])
            else
                insert!(A,ind,A[k])
            end
            deleteat!(A,k+1)
        end
    end
    return A
end

function quicksearch(iter,val)
    low=1
    high=length(iter)
    while low<high && val!=iter[div(low+high,2)]
        if val>iter[low]
            low=low+1
        end
        if val<iter[high]
            high=high-1
        end
    end
    m=div(low+high,2)
    if val!=iter[m]
        if val<iter[m]
            m=m-1
        elseif val>iter[m]
            m=m+1
        end
    end
    return m
end



