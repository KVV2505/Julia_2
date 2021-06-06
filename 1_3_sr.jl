#=Реализовать алгоритм сортировки методом пузырька, написав следующие 
4 обобщенные функции: bubblesort, bubblesort!, bubblesortperm,
bubblesortperm!, по аналогии со встоенными функциями sort!,
sort, sortperm!, sortperm, ограничившись только случаем, когда 
входной параметр есть одномерный массив (вектор).=#

function bubblesort!(a)
    size=length(a)
    for i in 1 : size-1
        for j in i : size
        if a[i]>a[j]
            a[i],a[j]=a[j],a[i]
        end
    end
end
return a
end

bubblesort(a)=bubblesort!(copy(a)) #не меняет исходный массив и поэтому передается копия

#sortperm!(x) возвращает перестановку индексов, массив меняется
#[100,20,10]->[10,20,100]
# 1   2   3    3   2  1

#sortperm(x) возвращает перестановку индексов, массив не меняется

function bubblesortperm!(a)
    size=length(a)
    index=collect(1:size) #collect создать массив со значениями от 1 до size 
    for i in 1 : size-1
        for j in i : size
            if a[i]>a[j]
                a[i],a[j]=a[j],a[i]   
                index[i],index[j]= index[j],index[i]      
            end
        end
    end
    return index
end

bubblesortperm(a)= bubblesortperm!(copy(a))


