function first_part()
    sum = 0

    open("input.txt", "r") do inp
        for line in eachline(inp)
            nums = [parse(Int, x) for x in split(line, " ")]
            sum += is_safe(nums)
        end
    end

    println(sum)
end

function second_part()
    sum = 0

    open("input.txt", "r") do inp
        for line in eachline(inp)
            nums = [parse(Int, x) for x in split(line, " ")]
            sum += is_safeish(nums)
        end
    end

    println(sum)
end

function is_safeish(nums)
    for i in 1:length(nums)

        new_nums = deepcopy(nums)
        deleteat!(new_nums, i)

        if is_safe(new_nums) > 0
            return 1
        end

    end
    return 0
end

function is_safe(nums)
    n0 = popfirst!(nums)
    decrease, increase = false, false

    for n in nums
        if abs(n-n0) > 3 || n==n0
            return 0
        end

        if n > n0
            if decrease
                return 0
            else
                increase = true
            end
        else
            if increase
                return 0
            else
                decrease = true
            end
        end

        n0 = n
    end
    
    return 1
end

first_part()
second_part()