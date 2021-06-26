function shortest_dist(start_ver::T, finish_ver::T, graph::ConnectList{T}) where T
    n = length(graph)
    dist = Array{Array{Int,1}}(undef,n)
    for i in 1:n
        dist[i] = []
    end
    queue  = [start_ver]
    dist[start_ver] = [start_ver]
    while !isempty(queue)
        v = popfirst!(queue)
        if v == finish_ver return dist[v] end
        for u in graph[v]
            if dist[u] == []
                push!(queue, u)
                dist[u] = push!(copy(dist[v]),u)
            end
        end
    end
end
