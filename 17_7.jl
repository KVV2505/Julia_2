function comp_count(graph::ConnectList)
    n = length(graph)
    mark = zeros(Bool,length(graph))
    count = 0
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
            count +=1
        end
    end
    return count
end