#=С использованием разработанной функции sortkey написать функцию 
высшего порядка, с тем же именем sortkey, но вместо массива ключевых
значений получающую на вход ключевую функцию и массив элементов 
некоторого типа, на множестве значений которых должна быть определена 
данная ключевая функция.=#


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