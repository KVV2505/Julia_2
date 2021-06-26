function comp_count_vert(graph::ConnectList)
    n = length(graph)
    mark = zeros(Bool,length(graph))
    vertices = []
    for i in 1:n
        if !mark[i]
            queue  = [i]
            mark[i] = 1
            while !isempty(queue)
                v = popfirst!(queue)
                for u in graph[v]
                    if mark[u] == 0
                        push!(queue, u)
                        mark[u] = 1
                    end
                end
            end
            push!(vertices,i)
        end
    end
    return vertices
end