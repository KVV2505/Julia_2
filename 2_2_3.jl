#=С использованием этой последней функции отсортировать столбцы какой-либо 
заданной числовой матрицы в порядке а) не убывания их сумм б) не убывания 
числа нулей в них =#

function sortkey(x,a)
    size=length(x)
    for i in 1:size
        for j in 1:size
            if x[i]>x[j]
                x[i],x[j]=x[j],x[i]
                a[i],a[j]=a[j],a[i]
            end
        end
    end
    return a
end

function sortkey(f::Function,a)
    sortkey(f.(a),a)
end

function summa(a)
    s=0
    for x in a
        s=s+x
    end
    return s
end
function k_zeros(a)
    s=0
    for x in a
        if x==0
            s=s+1
        end
    end
    return s
end

function sort_stolb_neub_summ(M)
    vec_colons=[@view M[:,j] for j in 1:size(M,2)]
    M=hcat(sortkey(summa,vec_colons))
    return M
end
function sort_stolb_neub_zeros(M)
    vec_colons=[@view M[:,j] for j in 1:size(M,2)]
    M=hcat(sortkey(k_zeros,vec_colons))
    return M
end