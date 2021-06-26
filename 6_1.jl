#=Написать функцию, получающую 2 отсортированных массива A и B, и объединяющую их в одном отсортированном массиве C (length(C)=length(A)+length(B)=n). Алгоритм должен иметь оценку сложности O(n). Функцию можно назвать merge. Реализовать 2 варианта этой функции:

а) merge(A,B) - возвращает массив C;

Этот пункт надо реализовать двумя способами: в первом - для формировния массива C воспользоваться встроенными функциями push! и append!, предварительно инициализировав C значением пустого массива, а во втором - этими функциями не пользоваться, и сразу захватить под массив C необходимую для его размещения память (с помощью конструктора Vector{Type_vector}(undef, len_vector)).=#

б) merge!(A,B,C) - используется внешний массив C (поэтому в конце имени функции и поставлен восклицательный знак).

function merge1(a,b)
    c=promote_type(eltype(a),eltype(b))[]
    for x in a
        append!(c,x)
    end
    for x in b
        append!(c,x)
    end
    return c
end

function merge2(a,b)
    c=Vector{promote_type(eltype(a),eltype(b))}(undef,length(a)+length(b))
    for i in 1:length(a)+length(b)
        if i<=length(a)
            c[i]=a[i]
        else
            c[i]=b[i-length(a)]
        end
    end
    return c
end

function merge!(a,b,c)
    for i in 1:length(a)+length(b)
        if i<=length(a)
            c[i]=a[i]
        else
            c[i]=b[i-length(a)]
        end
    end
    return c
end
