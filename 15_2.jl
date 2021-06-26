#=Написать функцию convert_to_list(tree::NestedVectors), получающую на
вход дерево, представленное вложенными векторами, и возвращающая кортеж из списка смежностей типа ConnectList этого дерева и 
индекса его корня.=#
function convert(tree)
    T=typeof(tree[end])
    connect_tree = Dict{T,Vector{T}}()
    
    function recurs_trace(tree)
        connect_tree[tree[end]]=[]
        for subtree in tree[1:end-1] 
            push!(connect_tree[tree[end]], recurs_trace(subtree))
        end
        return tree[end]
    end

    recurs_trace(tree)
    return connect_tree
end