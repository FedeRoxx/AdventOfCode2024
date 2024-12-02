function first_part()

    open("input.txt", "r") do inp
        left = []
        right = []

        for line in eachline(inp)
            a, b = [parse(Int, x) for x in split(line, "   ")]
            left, right = add_AB(left, right, a, b)
        end

        tot = sum([abs(left[i] - right[i]) for i in eachindex(left)])
        println(tot)
    end
  
end

function second_part()
    open("input.txt", "r") do inp
        left = []
        right = []

        for line in eachline(inp)
            a, b = [parse(Int, x) for x in split(line, "   ")]
            left, right = add_AB(left, right, a, b)
        end

        tot = 0
        for a in left
            tot += a*sum([1 for b in right if a == b])
        end
        println(tot)
    end
end

function add_AB(left, right, a, b)
    idx = findfirst(x -> x >= a, left)

    if idx === nothing
        push!(left, a)
    else
        insert!(left, idx, a)
    end

    idy = findfirst(x -> x >= b, right)

    if idy === nothing
        push!(right, b)
    else
        insert!(right, idy, b)
    end

    return left, right
end


first_part()
second_part()