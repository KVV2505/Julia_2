function dfsearch(startver::T, graph::ConnectList{T}) where T
    mark = zeros(Bool, length(graph))
    stack  = [startver]
    mark[startver] = 1
    visited = Int64[]
    while !isempty(stack)
        v = pop!(stack)
        push!(visited,v)
        for u in graph[v]
            if mark[u] == 0
                push!(stack,u)
                mark[u] = 1
            end
        end
    end
    return visited
end
