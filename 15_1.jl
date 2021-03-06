#=Написать функцию convert_to_nested(tree::ConnectList{T}, root::T) where T, получающую на вход дерево, представленное списком смежностей tree и индексом его корня root, и возвращающая представление того же дерева в виде 
вложенных векторов.=#
ConnectList{T}=Vector{Vector{T}}
function convert(tree::ConnectList{T}, root::T) where T
    b=[]
    for i in firstindex(tree):lastindex(tree)
        for j in firstindex(tree[i]):lastindex(tree[i])
            push!(b,vcat([[a] for a in tree[j+1]],tree[i][j]))
        end
        if length(tree[i])+2>length(tree) || lastindex(tree[length(tree[i])+2])==0
            break
        end
    end
    b=vcat(b,root)
    return b
end
