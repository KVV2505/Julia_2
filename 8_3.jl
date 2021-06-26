#=Сравнить время выполния различных реализаций алгоритма 
сортировки слияниями мужду собой и с встроенной функцией sort!. 
Длину массива следует взять достатоно большой, например, равной 
1_000_000. Сортируемый массив формировать с помощью встроенного 
генератора случайных массивов randn (возвращающую массив заданного
размера типа Float64, из нормально распределенных значений с нулевым 
математическим ожиданием (средним) и с единичным средним квадратическим 
отклонением).=#
using Random
using BenchmarkTools
function srav()
    array = []
    for i in 1:999999
        push!(array, rand())
    end
    array2 = array
    array3 = array
    @btime sort!(array)
    @btime mergesort!(array2)
    @btime mergesort1!(array3)
end

