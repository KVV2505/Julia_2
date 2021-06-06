#= Написать функцию calcsort, реализующую сортировку методом подсчета числа значений. Рассмотреть 2 варианта функции 
(2 метода - в терминологии Julia): в первом варианте возможные значения элементов сортируемого массива задаются некоторым диапазоном, 
во втором - некоторым отсортированным массивом (вектором).
Применить эту разработанную функцию для сортировки столбцов матрицы по числу находящихся в них нулей =#
 
#=function calcsort(a)
    b=[@view a[:,j] for j in 1:size(a,2)]
    k_s=[length(findall(b[j].==0)) for j in 1:length(b)]
    calcsortkey(b,k_s,collect(0:size(a,1)))
end

#=
 key_values=[0,1,2,3]
 key_series=[2,3,0,2,0]
 vector_vector_indexes[1]=[3,5]
 vector_vector_indexes[2]=[]
 vector_vector_indexes[3]=[1,4]
 vector_vector_indexes[4]=[2]
=#
function calcsortkey(a, key_series, key_values)
    vector_vector_indexes = calcsortindexes(key_series, key_values)
    #vector_vector_indexes -вектор, содержащий вектора 
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
# key_series-массив количества нулей в каждом столбце
#key_values- диапазон значений 
function calcsortindexes(key_series, key_values) 
    vector_vector_indexes = [] #fill(Int[], size(key_values)) # вектор соразмерный с key_values, состоящий из пустых векторов типа Vector{Int}  
    for _ in 1: size(key_values)
        push!(vector_vector_indexes,Int[])
    end
    for i in eachindex(key_series)
        push!(vector_vector_indexes[indexvalue(key_series[i], key_values)], i)
    end
    #для каждого k vector_vector_indexes[k]- содержит индексы key_series, соответствующие значению key_values[k]
    return vector_vector_indexes
end

# значение элемента совпадает с его индексом, поэтому мы ищем его номер  
#indexvalue(v, values::UnitRange) = v - values[1] + 1

indexvalue(v, values::Vector) = findfirst(x->x==v, values)   #значение x равно v =#

"""
    calcsort_numzeros(a)

- calcsort_numzeros - сортирует столбцы матрицы по невозрастанию числа содержащихся в ней нуле
методом посчета их количества
"""
function calcsort_numzeros(a)
    b=[@view a[:,j] for j in 1:size(a,2)]
    k_s=[length(findall(b[j].== 0)) for j in 1:length(b)]
    b = calcsortkey(b, k_s, collect(0:size(a,1)))
    return hcat(b...) # из вектора b, содержащего столбцы, снова формируется матрица путем горизонтальной конкатенации
end

"""
calcsortkey(a, key_series, key_values)

форимрует вектор из элементов вектора a в порядке неубывания их ключей из вектора key_sries 
"""
function calcsortkey(a, key_series, key_values)
    vector_vector_indexes = calcsortindexes(key_series, key_values)
    # vector_vector_indexes - вектор, содержащий ветора
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


"""
    calcsortindexes(key_series, key_values)

возвращает vector_vector_indexes
    пример: 
        key_values = [0,1,2,3]
        key_sries = [2,3,0,2,0]

        vector_vector_indexes = calcsortindexes(key_series, key_values)
    тогда
        vector_vector_indexes[1] = [3,5]
        vector_vector_indexes[2] = []
        vector_vector_indexes[3] = [1,4]
        vector_vector_indexes[4] = [2]
"""    
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

# ================================ ТЕСТ =========================
a=[[0,1,0] [1,1,1] [1,0, 0] [0,0,0] [1,1,1]]
#=
julia> a=[[0,1,0] [1,1,1] [1,0, 0] [0,0,0] [1,1,1]]
3×5 Array{Int64,2}:
 0  1  1  0  1
 1  1  0  0  1
 0  1  0  0  1
=#
calcsort_numzeros(a)|> println
#=
[1 1 0 1 0; 
 1 1 1 0 0; 
 1 1 0 0 0]
=#