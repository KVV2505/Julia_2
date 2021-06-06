#Аналогично, реализовать функцию, аналогичную встроенной функции copy для следующих случаев: a) аргумент функции - вектор 
#б) аргумент функции - матрица (2-мерный массив)
#(тут можно все свести к одному случаю, если воспользоваться встроенной функцией reshape, с помощью которой, например, 
#одномерный массив можно переформатировать в многомерный)

function copy_user(a)
    size=length(a)
    b=similar(a) # Vector{eltype(a)}(undef,size(a))#zeros(Int64, size) similar-создание подобного
    for i in 1:size
        b[i]=a[i]
    end
    return b
end
#=
function copy_user(a::Matrix)
    s=size(a)
    b=zeros(Int64, s)
    for i in 1:s[1]
        for j in 1: s[2]
            b[i,j]=a[i,j]
        end
    end
    return b
end
=#
c=[1 2 3;4 5 6]
copy_user(c)
println(c)