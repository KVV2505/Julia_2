#=Определить тип, позволяющий итерировать все k-элементные подмножества 
заданного n-элементного множества.
Указание. Обеспечить возможность передавать в конструктор типа как только
число n, что соответствовало бы последовательности {1,2,...,n}, так и
непосредственно какую-либо другую последовательность, представленную одномерным массивом.=#
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


struct SetIndicator{N} <: AbstractCombinObject
    value::Vector{Bool}
end

SetIndicator{N}() where N = SetIndicator{N}(zeros(Bool, N))

function next!(indicator::SetIndicator)
    i = findlast(item->item==0, indicator.value)
    if isnothing(i)
        return false
    end
    indicator.value[i] = 1
    indicator.value[i+1:end] .= 0
    return true 
end