function optpath_floyd(next::AbstractMatrix, i::Integer, j::Integer)
    path= [i]
    fin = i
    while (fin!=j)
        push!(path,next[fin,j])
        fin = next[fin,j]
    end
    return path
end