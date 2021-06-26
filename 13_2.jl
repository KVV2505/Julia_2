#=Определить тип, позволяющий итерировать все перестановки элементов заданного n элементного множества.
Указание. Обеспечить возможность передавать в конструктор типа как только
число n, что соответствовало бы последовательности {1,2,...,n}, так и 
непосредственно какую-либо другую последовательность, представленную
одномерным массивом.=#
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


struct Permute2{N} <: AbstractCombinObject
    value::Vector{Int}
end

Permute2{N}() where N = Permute2{N}(collect(1:N))

function next!(w::Permute2{N}) where N
    p=get(w)
    k=0
    for i in N-1:-1:1
        if p[i] < p[i+1]
            k=i
            break
        end
    end
    if k==0
        return false
    end
    i=k+1
    while i < N && p[i+1] > p[k]
        i+=1
    end
    p[k], p[i] = p[i], p[k]
    reverse!(@view p[k+1:end])
    return true
end
