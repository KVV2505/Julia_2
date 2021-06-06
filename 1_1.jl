#Реализовать функцию, аналогичную встроенной функции reverse!, назвав её, например, reverse_user!, для следующих случаев:
#a) аргумент функции - вектор б) аргумент функции - матрица (2-мерный массив)
#В обоих случаях имя функции должно быть одно и то же (это допустимо, поскольку в Julia реализована так называемая множественная 
#диспетчеризация), но во втором случае должен быть еще второй именованный параметр с именем dim.

function reverse_user!(a)
    size=length(a)
    size_h=div(size,2)
    for i in 1:size_h
        a[i],a[size+1-i]=a[size+1-i],a[i]
    end
    return a
end

function reverse_user!(a::Matrix; dim=1) #размерность 1 или 2. 1-сортировка по столбцу, 2-сортировка по строке. По умолчанию 1
    s=size(a) #кортеж для двумерного 
    if dim==1
        for i in 1:s[2]
            reverse_user!(@view a[:,i])  #срез i-ого столбца
        end
    elseif dim==2
        for j in 1:s[1]
            reverse_user!(@view a[j,:])
        end
    else
        return ("dim in 1:2")
    end
    return a
end

#c=[1 2 3;4 5 6]
#reverse_user!(c;dim=1)
#println(c)