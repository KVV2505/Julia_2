#=Написать функцию convert(tree::Tree{T}) where T, получающую на вход 
ссылку на связанные структуры типа Tree{T}, представляющие некоторое 
дерево, и возвращающая кортеж из списка смежностей типа ConnectList 
этого дерева и индекса его корня.=#
function convert(tree::Tree{T}) where T
    res = []
    root = 1
    for i in 2:tree.index
        push!(res,[])
        root+=1
    end
    q = [tree]
    while (!isempty(q))
        cur = first(q)
        q = append!(q,cur.sub)
        deleteat!(q,firstindex(q))
        for i in cur.sub
            if (cur.index > length(res))
                while (i.index != length(res))
                    push!(res,[])
                end
            end
            push!(res[cur.index],i.index)
        end
    end
    return res
end