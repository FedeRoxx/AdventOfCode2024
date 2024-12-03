function first_part()
    sum = 0
    content = open("input.txt", "r") do inp
        read(inp, String)  # Read the entire file as a string
    end

    println(count_mul(content))
    
end

function count_mul(content)
    sum = 0

    numbers = [split(a, ")")[1] for a in split(content, "mul(")]
    for n in numbers
        try
            a,b = split(n, ",")

            n1 = occursin(" ", a) ? 0 : parse(Int, a)
            n2 = occursin(" ", b) ? 0 : parse(Int, b)

            if length(split(n, ",")) != 2
                n1 = 0
            end

            sum += n1 * n2
        catch e
        end
    end

    return sum

end

function second_part()
    sum = 0
    content = open("input.txt", "r") do inp
        read(inp, String)  # Read the entire file as a string
    end

    lines = [split(a, "don't()")[1] for a in split(content, "do()")]

    for line in lines
        sum += count_mul(line)
    end

    println(sum)
end

first_part()
second_part()