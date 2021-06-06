#Реализовать сортировку столбцов матрицы по значению в них числа нулей для данного случая
# calc_sortnum - сортирует столбцы матрицы по невозрастанию числа содержащихся в ней нуле
#методом посчета их количества

#calcsortkey(a, key_series, key_values)
#форимрует вектор из элементов вектора a в порядке неубывания их ключей из вектора key_series 

#calcsortindexes(key_series, key_values)
#возвращает вектор векторов vector_vector_indexes

# key_series-массив количества нулей в каждом столбце
#key_values- диапазон значений 

function calc_sortnum(a)
    b=[@view a[:,j] for j in 1:size(a,2)]
    k_s=[length(findall(b[j].== 0)) for j in 1:length(b)]
    b = calcsortkey(b, k_s, collect(0:size(a,1)))
    return hcat(b...) # из вектора b, содержащего столбцы, снова формируется матрица путем горизонтальной конкатенации
end
 
function calcsortkey(a, key_series, key_values)
    vector_vector_indexes = calcsortindexes(key_series, key_values)
    # vector_vector_indexes - вектор векторов 
    c=similar(a)
    j=1
    for vector_indexes in vector_vector_indexes  
        for i in vector_indexes
            c[j] = a[i]
            j+=1
        end
    end
    return c
end

#key_values = [0,1,2,3]
#key_series = [2,3,0,2,0]
#vector_vector_indexes[1] = [3,5]
#vector_vector_indexes[2] = []
#vector_vector_indexes[3] = [1,4]
#vector_vector_indexes[4] = [2]
   
function calcsortindexes(key_series, key_values) #m+1

    vector_vector_indexes=[Int[] for _ in key_values]
    # - это vector_vector_indexes - вектор соразмерный с key_values, состоящий из пустых векторов типа Vector{Int}  
    
    for i in eachindex(key_series)
        k=indexvalue(key_series[i], key_values)
        push!(vector_vector_indexes[k], i)
    end
    #для каждого k vector_vector_indexes[k] - содержит индексы key_series, соответствующие значению key_values[k] 
    
    return vector_vector_indexes
end

indexvalue(v, values::Vector) = findfirst(x->x==v, values)
