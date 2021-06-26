#using Polynomials

module Polynoms
    import Base: +, *,\,%,÷

    struct Polynom{T}
        coeff::Vector{T}
    end

    function +(p::Polynom, q::Polynom)
        np,nq = length(p.coeff), length(q.coeff)
        r=Vector{promote_type(eltype(p),eltype(q))}(undef,max(np,nq))
        if np >= nq
            r .= (@view p.coeff[end-nq+1:end]) .+ q.coeff  
        else
            r .= (@view q.coeff[end-np+1:end]) .+ p.coeff
        end
        return Polynom(r)
    end

    function +(p::Polynom, c::Number)
        coeff=p.coeff
        coeff[end]+=c
        return Polynom(coeff)
    end

    +(c::Number, p::Polynom)=p+c

    function *(p::Polynom, q::Polynom)
        np,nq = length(p.coeff), length(q.coeff)
        coeff=zeros(promote_type(eltype(p),eltype(q)), np+nq-1)
        for i in eachindex(p.coeff), j in eachindex(q)
            coeff[i+j-1] += p.coeff[i]*q.coeff[j]
        end
        return Polynom(coeff)
    end

    function *(p::Polynom, c::Number)
        np = length(p.coeff)
        coeff=zeros(promote_type(eltype(np),typeof(c)), np)
        for i in eachindex(p.coeff)
            coeff[i] += p.coeff[i]*c
        end
        return Polynom(coeff)
    end


    function diff(p::Polynom,x::Number,ord=1)
        A=p.coeff
        q=zeros(Int64,ord-1)
        Q=0
        for a in A
            i=ord-1
            while i>1
                q[i]=q[i]*x+q[i-1]
                i=i-1
            end
            q[1]=q[1]*x+Q
            Q=Q*x+a
        end
        return q[ord-1]*factorial(ord-1)
    end

    function diffpoly(a::AbstractVector)
        b=copy(a)
        for i in 1:length(a)
            b[i]=b[i]*(length(a)-i)
        end
        deleteat!(b,length(a))
        return b
    end

    function intpoly(a::AbstractVector)
        b=copy(a)
        push!(b,0)
        for i in 1:length(a)
            b[i]=b[i]/(length(a)-i+1)
        end
        return b
    end

    function divrem(a::AbstractVector,b::AbstractVector)
        q=[]
        r=copy(a)
        while length(r)>=length(b)
            k=length(r)-length(b)
            c=vcat(b,zeros(Int64,k))
            push!(q,r[1])
            r=r-r[1]*c
            deleteat!(r,1)
        end
        return q,r
    end

    diff(a::Polynom)=Polynom(diffpoly(a))

    integral(a::Polynom)=Polynom(intpoly(a))

    \(a::Polynom,b::Polynom)=divrem(a.coeff,b.coeff)

    ÷(a::Polynom, b::Polynom)=divrem(a.coeff,b.coeff)[1]

    %(a::Polynom, b::Polynom)=divrem(a.coeff,b.coeff)[2]

    *(c::Number, p::Polynom) = p*c
end
