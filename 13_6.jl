#=Дать решение всех остальных рассматривавшихся выше задач в функциональном стиле, т.е. с помощью разработки соответствующих функций, возвращающих тот или иной гененратор.=#
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

function permutations(a::Permute2)
    n = length(a.value)
    p=collect(1:n)

    function next()
        perm_a = a.value[p]
        p = next!(p)
        return perm_a
    end

    return (next() for _ in 1:factorial(n))
end

permutations(n::Integer) = permutations(collect(1:n))

function replacements(a::RepPlacement)
    n = length(a.value)
    p = collect(1:n)

        function next()
            rep_a = a.value[p]
            p = next!(p)
            return rep_a
        end
    
    return (next() for _ in 1:factorial(n))
end

replacements(n::Integer) = replacements(RepPlacement{n}())

function setindicators(a::SetIndicator)
    n = length(a.value)
    p = collect(1:n)

        function next()
            set_a = a.value[p]
            p = next!(p)
            return set_a
        end
    
    return (next() for _ in 1:factorial(n))
end

setindicators(n::Integer) = setindicators(SetIndicator{n}())

function ksetindicators(a::KSetIndicator)
    n = length(a.value)
    p = collect(1:n)

        function next()
            kset_a = a.value[p]
            p = next!(p)
            return kset_a
        end
    
    return (next() for _ in 1:factorial(n))
end

ksetindicators(n::Integer,k::Integer) = ksetindicators(KSetIndicator{n,k}())

function numsplits(a::NumSplit)
    n = length(a.value)
    p = collect(1:n)

        function next()
            num = a.value[p]
            p = next!(p)
            return num
        end
    
    return (next() for _ in 1:factorial(n))
end

numsplits(n::Integer) = numsplits(NumSplit{n}())


