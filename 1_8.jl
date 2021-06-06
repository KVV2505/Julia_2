#Реализовать ранее написанную функцию insertsort! с помощью встроенной функции 
#reduce (решение приведено в конце списка задач).

insertsort!(A)=reduce(1:length(A))do _, k 
    while k>1 && A[k-1] > A[k]
        A[k-1], A[k] = A[k], A[k-1]
        k= k - 1
    end
    return A
end