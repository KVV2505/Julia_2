function bfsearch(startver::T, graph::ConnectList{T}) where T
    mark = zeros(Bool, length(graph))
    queue  = [startver]
    mark[startver] = 1
    visited = Int64[]
    while !isempty(queue)
        v = popfirst!(queue)
        push!(visited,v)
        for u in graph[v]
            if mark[u] == 0
                push!(queue, u)
                mark[u] = 1
            end
        end
    end
    return visited
end
