function first_part()
    sum = 0
    open("input.txt", "r") do inp
        line = readline(inp)
        dim = length(line)
        mat = reshape([c for c in line], (1, dim))
        c=1
        for (i, line) in enumerate(eachline(inp))
            mat = vcat(mat, reshape([a for a in line], (1, dim)))
        end
        println(count_XMAS(mat, dim))
    end
end

function count_XMAS(mat, dim)
    sum = 0

    for i in 1:dim
        for j in 1:dim
            if mat[i,j] == 'X'
                sum += check_around(mat, dim, i, j)
            end
        end
    end
        
    return sum
end

function check_around(mat, dim, i, j)
    directions = [(1,1),(1,−1),(1,0),(−1,1),(−1,−1),(−1,0),(0,1),(0,−1)]

    count = 0

    for (x, y) in directions
        try
            word = join([mat[i+k*x,j+k*y] for k in 1:3])
            if word == "MAS"
                count+= 1
            end
        catch
        end
    end
    return count
end


function count_MAS(mat, dim)
    sum = 0
    for i in 1:dim
        for j in 1:dim
            if mat[i,j] == 'A'
                sum += check_onX(mat, i, j)
            end
        end
    end  
    return sum
end

function check_onX(mat, i, j)
    directions = [(1,1),(1,−1),(−1,1),(−1,−1)]
    count = 0
        try
            word = join([mat[i+x,j+y] for (x, y) in directions])
            num_M = sum([1 for c in word if c == 'M'])
            num_S = sum([1 for c in word if c == 'S'])
            good = word[2] == word[3] ? false : true

            if (num_M*num_S == 4 && good)
                count += 1
            end
        catch
        end
    return count
end

function second_part()
    sum = 0
    open("input.txt", "r") do inp
        line = readline(inp)
        dim = length(line)
        mat = reshape([c for c in line], (1, dim))
        c=1
        for (i, line) in enumerate(eachline(inp))
            mat = vcat(mat, reshape([a for a in line], (1, dim)))
        end
        println(count_MAS(mat, dim))
    end
end

first_part()
second_part()