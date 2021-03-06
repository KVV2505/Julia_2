#=Написать функцию convert(tree::ConnectList{T}, root::T) where T, получающую на вход дерево, представленное списком смежностей tree и индексом его корня root, и возвращающая ссылку на связанные стркутруры типа Tree{T}, 
представляющие то же самое дерево=#
function tree_convert(tree::ConnectList{T}, root::T) where T
    tr = copy(tree)
    arr = Array{Tree{Int}}(undef,length(tr))
    for i in 1:length(tr)
        arr[i] = Tree{Int}(i,[])
    end
    list = arr[root]
    a = [root]
    while (!isempty(a))
        cur = first(a)
        deleteat!(a,firstindex(a))
        a = append!(a,tr[cur])
        for tree in tr[cur]
            push!(list_arr[cur].sub,list_arr[tree])
        end
    end
    return list
end