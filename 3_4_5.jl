#=Написать функцию с заголовком
slice(A::AbstractVector, p::AbstractVector{<:Integer})
возвращающую соответствующий срез неокоторого одномерного массива A.=#
function slice(A::Vector{T},p::Vector{Int})::Vector{T} where T
    B=Vector{T}(undef,size(A))
    B=A[p]
    return B
end