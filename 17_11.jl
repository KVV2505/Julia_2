function topological_sort!(graph::ConnectList{T}) where T
    n = length(graph)
    ver_series = T[]
    mark_ver = zeros(Bool, n)
    is_cycle = false
    while count(m->m==0, mark_ver)!=0 && !is_cycle
        is_cycle = true
        for v in setdiff(1:n, ver_series)
            if count(i->(mark_ver[i]==0), graph[v])==0
                push!(ver_series, v)
                mark_ver[v]=1
                is_cycle=false
            end
        end
    end
    if count(m->m==0, mark_ver)!=0 return nothing end
    return ver_series
end
