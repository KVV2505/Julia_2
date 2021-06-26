module Binomials
    export Binomial, ord, binomial_coeffs

    function binomial_coeffs(n::Integer)
    # Эта реализация - просто для тестирвания Binomial
        if n in 0:1 return [1] end
        if n == 2 return [1,2] end
        if n == 3 return [1,3] end
        if n == 4 return [1,4,6] end
        if n == 5 return [1,5,10] end
        if n == 6 return [1,6,15,20] end
        if n == 7 return [1,7,21,35] end
        error("Индекс больше 7")
    end

    """
        Binomial(::Integer)
    
    Пользовательский тип данных, обеспечивающий удобную работу с биномиальными коэффициентами заданного порядка:

    -- конструктор создаёт итерируемый объкт типа Binomial

    -- ord(::Binomial) - возвращает порядок объекта типа Binomial

    -- (b::Binomial)(k::Integer) - возвращает k-ый биномиальный коэффициент соответствующего порядка (ord(b))
    """
    struct Binomial 
        coeffs::Vector{Int} # в принципе, можно было бы сделать и ::NTuple{N,Int} where N
        n::Int
        Binomial(n::Integer)=new(binomial_coeffs(n),n)
    end

    (b::Binomial)(k::Integer) = b.coeffs[min(k,ord(b)-k)+1]
    # - это определяет объекты типа Binomial, как collable-объекты (объекты, вызываемые подобно функции), называемые также **функторами**

    ord(b::Binomial) = b.n
    
    Base.iterate(b::Binomial) = (b.coeffs[1], ord(b)==0 ? nothing : 2)
    Base.iterate(b::Binomial, s) = (b.coeff[s], ord(b)==s ? nothing : s+1)
    # здесь для нового типа переопределяется функция iterate из модуля Base
end # module Binomials