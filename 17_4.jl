function bfs_valence(graph::ConnectList{T}) where T
    mark = zeros(Int64, length(graph))
    queue  = [1]
    mark[1] = 1
    while !isempty(queue)
        v = popfirst!(queue)
        println(v)
        for u in graph[v]
            if mark[u] == 0
                push!(queue, u)
            end
            mark[u] = mark[u] + 1
        end
    end
    mark[1] -= 1
    return mark
end