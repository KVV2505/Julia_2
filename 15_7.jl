ConnectList{T}=Vector{Vector{T}}
function find_general(tree::Vector, setver::Set, ConnectList::ConnectList{T}) where T

    number_visited = 0 # - cчетчик числа посещённых вершин из набора setver

    general = 0 # - в этой переменной формируется результат (её начальное значение может быть любым)

	function recurstrace(tree, parent=0) # - выполняет рекурсивную обработку дерева сверху-вниз      
        is_mutable_general = false # при движение по дереву вглубь от корня внешнюю переменную general изменять не надо 
		for subtree in tree[begin:end-1]
            if number_visited < length(setver)
			    recurstrace(subtree, tree[end])
            end
		end
		#УТВ: number_visited = число посещенных вершин из заданного набора setver
        if tree[end] in setver
            number_visited +=1
            if number_visited == 1
                general = tree[end]
            end                        
        end
        # теперь - обратное движение по дереву - из глубины к корню
        if general==tree[end] 
            is_mutable_general = true # т.е. при движении к корню, внешнюю переменную general снова нужно отслеживать
        end
		if is_mutable_general && number_visited < length(setver)
            general = parent
		end	
        println((current=tree[end],parent=parent,general=general)) # - это для отладки
	end
	
	recurstrace(tree)

    return general
end
