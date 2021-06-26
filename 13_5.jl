#=Определить тип, позволяющий итерировать все разбиения заданного 
натурального числа n на положительные слагаемые. При этом, по-прежднему 
представляя разбиения как невозрастающие последовательности, перечислять
их в порядке, обратном лексикографическому.=#

abstract type AbstractCombinObject
    #value::Vector{Int} - это поле предполагается у всех конкретных типов, наследующих от данного типа
end

Base.iterate(obj::AbstractCombinObject) = (get(obj), nothing)
Base.iterate(obj::AbstractCombinObject, state) = 
    if next!(obj) == false
        nothing
    else
        (get(obj), nothing)
    end

Base.get(obj::AbstractCombinObject) = obj.value

struct NumSplit{N} <: AbstractCombinObject
    value::Vector{Int}
    num_terms::Int
end

NumSplit{N}() where N = NumSplit{N}(collect(1:N), N)

function next!(split::NumSplit{T}) where T 
    if split.num_terms == 1
        false
    end
    s=split.value
    k=split.num_terms
    i=k-1
    while i > 1 && s[i-1]==s[i]
        i -= 1
    end
    s[i] += 1
    r=sum(@view s[i+1:k])
    k=i+r-1
    s[i+1:k] .= 1
    split.num_terms = k
    return true
end