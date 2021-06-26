function valence(graph::ConnectList{T}) where T
    val = zeros(size(graph,1))
    for i in 1:size(graph,1)
        val[i]=length(graph[i])
    end
    return val
end
